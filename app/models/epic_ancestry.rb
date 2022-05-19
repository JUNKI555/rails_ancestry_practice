class EpicAncestry < ApplicationRecord
  has_many :issue_ancestries
  belongs_to :board_ancestry
end
