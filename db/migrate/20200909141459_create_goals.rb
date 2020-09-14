class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :description
      t.integer :todo_id
      t.integer :completed, default: 0

      t.timestamps
    end
  end
end
