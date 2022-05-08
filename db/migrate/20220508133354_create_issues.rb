class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.references :epic, null: false, foreign_key: true
      t.string :issue_name
      t.string :description

      t.timestamps
    end
  end
end
