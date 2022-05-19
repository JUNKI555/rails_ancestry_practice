class CreateEpicAncestries < ActiveRecord::Migration[6.1]
  def change
    create_table :epic_ancestries do |t|
      t.references :board_ancestry, null: false, foreign_key: true
      t.string :epic_name
      t.integer :cost

      t.timestamps
    end
  end
end
