class BoardAncestry < ApplicationRecord
  has_ancestry orphan_strategy: :rootify, cache_depth: true
  has_many :epic_ancestries
end
