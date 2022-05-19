# == Schema Information
#
# Table name: issue_closures
#
#  id              :bigint           not null, primary key
#  description     :string(255)
#  issue_name      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  epic_closure_id :bigint           not null
#
# Indexes
#
#  index_issue_closures_on_epic_closure_id  (epic_closure_id)
#
# Foreign Keys
#
#  fk_rails_...  (epic_closure_id => epic_closures.id)
#
class IssueClosure < ApplicationRecord
  belongs_to :epic_closure
end
