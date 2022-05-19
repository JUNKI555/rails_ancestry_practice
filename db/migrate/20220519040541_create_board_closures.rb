class CreateBoardClosures < ActiveRecord::Migration[6.1]
  def change
    create_table :board_closures do |t|
      t.string :board_name

      t.timestamps
    end
  end
end
