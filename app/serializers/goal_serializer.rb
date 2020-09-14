class GoalSerializer < ActiveModel::Serializer
  attributes :id, :todo_id, :description, :completed
  belongs_to :todo
end
