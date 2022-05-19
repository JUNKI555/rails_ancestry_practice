class EpicClosure < ApplicationRecord
  has_many :issue_closures
  belongs_to :board_closure
end
