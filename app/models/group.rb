class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :entities, dependent: :destroy

  validates :name, presence: true

  # before_create :set_default_avatar

  # def set_default_avatar
  #   self.icon = 'default.jpg'
  # end
end
