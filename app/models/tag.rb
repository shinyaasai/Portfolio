class Tag < ApplicationRecord
  has_many :record_tag_relations, dependent: :delete_all
  has_many :records, through: :record_tag_relations
end
