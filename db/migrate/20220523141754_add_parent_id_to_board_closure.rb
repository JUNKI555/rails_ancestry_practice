class AddParentIdToBoardClosure < ActiveRecord::Migration[6.1]
  def change
    add_column :board_closures, :parent_id, :integer
    add_index :board_closures, :parent_id
  end
end
