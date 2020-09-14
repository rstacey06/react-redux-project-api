# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.delete_all

Todo.create(target:"Remodel Kitchen", plan: "Do whatever my wife wants")
Todo.create(target:"Grocerys", plan: "Go to the Grocery Store")

Goal.create(description: "Eggs", todo_id: 13, completed: 0)
Goal.create(description: "Milk", todo_id: 13, completed: 0)
Goal.create(description: "Bread", todo_id: 13, completed: 0)

Goal.create(description: "Higher a Contractor", todo_id: 12, completed: 0)
Goal.create
