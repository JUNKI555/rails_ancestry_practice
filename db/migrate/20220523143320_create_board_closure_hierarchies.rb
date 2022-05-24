class CreateBoardClosureHierarchies < ActiveRecord::Migration[6.1]
  def change
    create_table :board_closure_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :board_closure_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "board_closure_anc_desc_idx"

    add_index :board_closure_hierarchies, [:descendant_id],
      name: "board_closure_desc_idx"
  end
end
