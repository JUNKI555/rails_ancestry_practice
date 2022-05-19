# == Schema Information
#
# Table name: epic_closures
#
#  id               :bigint           not null, primary key
#  cost             :integer
#  epic_name        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  board_closure_id :bigint           not null
#
# Indexes
#
#  index_epic_closures_on_board_closure_id  (board_closure_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_closure_id => board_closures.id)
#
class EpicClosure < ApplicationRecord
  has_many :issue_closures
  belongs_to :board_closure
end
