class Todo < ApplicationRecord
    has_many :goals, dependent: :destroy
    validates :target, :plan, presence: true
end
