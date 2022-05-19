# == Schema Information
#
# Table name: board_closures
#
#  id         :bigint           not null, primary key
#  board_name :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BoardClosure < ApplicationRecord
  has_many :epic_closures
end
