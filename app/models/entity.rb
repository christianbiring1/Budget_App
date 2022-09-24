class Entity < ApplicationRecord
  # Ordered by the date of creation
  default_scope { order(created_at: :desc) }
  after_initialize :initial

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :group

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }


  def initial
    self.amount ||= 0
  end
end