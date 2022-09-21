class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :entities, foreign_key: 'group_id'

  validate :name, :amount, presence: true
end