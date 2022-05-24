# == Schema Information
#
# Table name: board_closures
#
#  id         :bigint           not null, primary key
#  board_name :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Indexes
#
#  index_board_closures_on_parent_id  (parent_id)
#
class BoardClosure < ApplicationRecord
  has_closure_tree name_column: 'board_name'
  has_many :epic_closures
end
