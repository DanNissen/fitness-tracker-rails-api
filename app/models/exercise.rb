class Exercise < ApplicationRecord
  has_many :workouts
  belongs_to :user
  validates :user, :name, :description, :link, presence: true
end
