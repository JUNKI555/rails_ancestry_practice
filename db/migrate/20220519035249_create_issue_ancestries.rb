class CreateIssueAncestries < ActiveRecord::Migration[6.1]
  def change
    create_table :issue_ancestries do |t|
      t.references :epic_ancestry, null: false, foreign_key: true
      t.string :issue_name
      t.string :description

      t.timestamps
    end
  end
end
