class CreateBoardAncestries < ActiveRecord::Migration[6.1]
  def change
    create_table :board_ancestries do |t|
      t.string :board_name

      t.timestamps
    end
  end
end
