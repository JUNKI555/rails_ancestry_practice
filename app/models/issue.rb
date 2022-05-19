# == Schema Information
#
# Table name: issues
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  issue_name  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  epic_id     :bigint           not null
#
# Indexes
#
#  index_issues_on_epic_id  (epic_id)
#
# Foreign Keys
#
#  fk_rails_...  (epic_id => epics.id)
#
class Issue < ApplicationRecord
  belongs_to :epic
end
