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

  scope :leaves, -> { joins("LEFT JOIN board_ancestries AS c ON c.ancestry = CAST(board_ancestries.id AS char(50)) OR c.ancestry = concat(board_ancestries.ancestry, '/', board_ancestries.id)").group("board_ancestries.id").having('COUNT(c.id) = 0') }
  scope :not_parents_and_not_children, -> { roots.leaves }
  scope :parents, -> { where(id: BoardAncestry.select(:ancestry).distinct.pluck(:ancestry).compact.map { |x| x.split('/') }.flatten.uniq) }
  scope :parents_or_children, -> { parents.or(BoardAncestry.where.not(ancestry: nil)) }

  def belong_subtree
    self.root.subtree
  end
end
