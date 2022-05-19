# == Schema Information
#
# Table name: epics
#
#  id         :bigint           not null, primary key
#  cost       :integer
#  epic_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_epics_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
class Epic < ApplicationRecord
  belongs_to :board
end
