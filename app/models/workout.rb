class Workout < ApplicationRecord
  belongs_to :exercise
  belongs_to :user
  validates :exercise, :user, :date, :sets, :reps, :rest_in_seconds, :tempo, presence: true
end
