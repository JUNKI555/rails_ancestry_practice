# == Schema Information
#
# Table name: issue_ancestries
#
#  id               :bigint           not null, primary key
#  description      :string(255)
#  issue_name       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  epic_ancestry_id :bigint           not null
#
# Indexes
#
#  index_issue_ancestries_on_epic_ancestry_id  (epic_ancestry_id)
#
# Foreign Keys
#
#  fk_rails_...  (epic_ancestry_id => epic_ancestries.id)
#
class IssueAncestry < ApplicationRecord
  belongs_to :epic_ancestry
end
