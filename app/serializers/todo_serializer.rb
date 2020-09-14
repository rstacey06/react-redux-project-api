class TodoSerializer < ActiveModel::Serializer
  attributes :id, :target, :plan, :completed
  has_many :goals
end 
