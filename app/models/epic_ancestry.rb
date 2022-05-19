# == Schema Information
#
# Table name: epic_ancestries
#
#  id                :bigint           not null, primary key
#  cost              :integer
#  epic_name         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  board_ancestry_id :bigint           not null
#
# Indexes
#
#  index_epic_ancestries_on_board_ancestry_id  (board_ancestry_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_ancestry_id => board_ancestries.id)
#
class EpicAncestry < ApplicationRecord
  has_many :issue_ancestries
  belongs_to :board_ancestry
end
