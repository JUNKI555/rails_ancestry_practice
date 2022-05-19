# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  board_name :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
end
