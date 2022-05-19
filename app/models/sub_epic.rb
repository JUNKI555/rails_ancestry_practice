# == Schema Information
#
# Table name: sub_epics
#
#  id           :bigint           not null, primary key
#  cost         :integer
#  epic_name    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  sub_board_id :bigint           not null
#
# Indexes
#
#  index_sub_epics_on_sub_board_id  (sub_board_id)
#
# Foreign Keys
#
#  fk_rails_...  (sub_board_id => sub_boards.id)
#
class SubEpic < ApplicationRecord
  belongs_to :sub_board
end
