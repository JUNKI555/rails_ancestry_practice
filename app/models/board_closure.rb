# == Schema Information
#
# Table name: board_closures
#
#  id         :bigint           not null, primary key
#  board_name :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Indexes
#
#  index_board_closures_on_parent_id  (parent_id)
#
class BoardClosure < ApplicationRecord
  has_closure_tree name_column: 'board_name'
  has_many :epic_closures

  # 親でもないし子孫でもない
  scope :not_parents_and_not_children, -> {
    where(parent_id: nil).where("NOT EXISTS (#{ancestor_hierarchy_sql})")
  }

  # 親である
  scope :parents, -> {
    where("EXISTS (#{ancestor_hierarchy_sql})")
  }

  # 親、もしくは子孫である
  scope :parents_or_children, -> {
    where.not(parent_id: nil).or(BoardClosure.where("EXISTS (#{ancestor_hierarchy_sql})"))
  }

  # EXISTS/NOT EXISTS で使う用の、1世代以降のhierarchyが存在するかのSQLを生成
  def self.ancestor_hierarchy_sql
    BoardClosure.hierarchy_class
                .select(1)
                .where('`ancestor_id` = `board_closures`.`id`')
                .where('`generations` > 0')
                .to_sql
  end

  # 取引先配列の全ての親取引先
  def self.parent_customers(board_closures)
    BoardClosure.where(id: board_closures.pluck(:parent_id))
  end

  def belong_hash_tree
    self.root.hash_tree
  end
end
