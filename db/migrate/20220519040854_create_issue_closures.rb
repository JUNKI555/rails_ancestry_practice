class CreateIssueClosures < ActiveRecord::Migration[6.1]
  def change
    create_table :issue_closures do |t|
      t.references :epic_closure, null: false, foreign_key: true
      t.string :issue_name
      t.string :description

      t.timestamps
    end
  end
end
