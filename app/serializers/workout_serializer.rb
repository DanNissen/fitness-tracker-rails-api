class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date, :sets, :reps, :rest_in_seconds, :tempo
  has_one :exercise
  has_one :user
end
