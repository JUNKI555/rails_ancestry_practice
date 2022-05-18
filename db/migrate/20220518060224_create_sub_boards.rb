class CreateSubBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_boards do |t|
      t.string :board_name

      t.timestamps
    end
  end
end
