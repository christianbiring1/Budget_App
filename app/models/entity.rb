class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :groups, foreign_key: 'entity_id'

  validate :name, :icon, presence: true
end