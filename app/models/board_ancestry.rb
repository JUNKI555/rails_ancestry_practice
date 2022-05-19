# == Schema Information
#
# Table name: board_ancestries
#
#  id             :bigint           not null, primary key
#  ancestry       :string(255)
#  ancestry_depth :integer          default(0)
#  board_name     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_board_ancestries_on_ancestry  (ancestry)
#
class BoardAncestry < ApplicationRecord
  has_ancestry orphan_strategy: :rootify, cache_depth: true
  has_many :epic_ancestries
end
