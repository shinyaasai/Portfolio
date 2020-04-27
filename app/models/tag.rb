class Tag < ApplicationRecord
  has_many :record_tag_relations, dependent: :destroy
  has_many :records, through: :record_tag_relations
end
