class CreateSubEpics < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_epics do |t|
      t.references :sub_board, null: false, foreign_key: true
      t.string :epic_name
      t.integer :cost

      t.timestamps
    end
  end
end
