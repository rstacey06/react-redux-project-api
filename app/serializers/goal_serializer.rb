class GoalSerializer < ActiveModel::Serializer
  attributes :id, :todo_id, :description, :completed
  belongs_to :todo
end

# below we add our attributes we want to access for our objective

# then we need to ensure goal comes through, as a parent to objectives - we add the belongs_to relationship
