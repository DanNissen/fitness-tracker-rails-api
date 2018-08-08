class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :link
  has_one :user
end
