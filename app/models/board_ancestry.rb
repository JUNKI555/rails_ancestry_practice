# == Schema Information
#
# Table name: board_ancestries
#
#  id             :bigint           not null, primary key
#  ancestry       :string(255)
#  ancestry_depth :integer          default(0)
#  board_name     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_board_ancestries_on_ancestry  (ancestry)
#
class BoardAncestry < ApplicationRecord
  has_ancestry orphan_strategy: :rootify, cache_depth: true
  has_many :epic_ancestries

  # 末端である（遅いクエリなので注意！）
  scope :leaves, -> { joins("LEFT JOIN board_ancestries AS c ON c.ancestry = CAST(board_ancestries.id AS char(50)) OR c.ancestry = concat(board_ancestries.ancestry, '/', board_ancestries.id)").group("board_ancestries.id").having('COUNT(c.id) = 0') }

  # 親でもないし子孫でもない(rootかつ末端)(rootsは親が含まれるので自分を親にするものは除外)
  scope :not_parents_and_not_children, -> {
    roots.joins("LEFT JOIN board_ancestries AS c ON c.ancestry LIKE CONCAT(board_ancestries.id, '/%')").where('c.id IS NULL')
  }

  # 親である
  scope :parents, -> { where(id: BoardAncestry.select(:ancestry).distinct.pluck(:ancestry).compact.map { |x| x.split('/') }.flatten.uniq) }

  # 親、もしくは子孫である
  scope :parents_or_children, -> { parents.or(BoardAncestry.where.not(ancestry: nil)) }

  # 取引先配列の全ての親取引先
  def self.parent_customers(board_ancestries)
    BoardAncestry.where(id: board_ancestries.map do |i| i.parent_id end)
  end

  # nodeの全ての子孫
  def belong_sub_tree
    self.root.subtree.order(ancestry: :asc).order(id: :asc)
  end
end
