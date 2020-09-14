class CreateTodos < ActiveRecord::Migration[6.0]
  def change
  create_table :todos do |t|
    t.string :target
    t.string :plan
    t.integer :completed, default: 0

    t.timestamps
    end
  end
end
