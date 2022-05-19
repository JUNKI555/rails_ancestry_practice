class AddAncestryToBoardAncestry < ActiveRecord::Migration[6.1]
  def change
    add_column :board_ancestries, :ancestry, :string
    add_column :board_ancestries, :ancestry_depth, :integer, :default => 0
    add_index :board_ancestries, :ancestry
  end
end
