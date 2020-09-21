class TodosController < ApplicationController

  # before any action, our set_todo method will run
  before_action :set_todo, only: [:show, :destroy, :toggle]

  # show all todos and render as JSON
    def index
        @todos = Todo.all
        render json: @todos
    end

    #vdont need @todo = Todo.find(params[:id]) ,because before_action of :set_todo
    def show
        render json: @todo
    end

    # create a new todo, abiding by the todo parameters below
    def create
        @todo = Todo.create(todo_params)
        render json: @todo
    end

    # delete a todo permanently
    def destroy
        @todo.destroy
        render json: @todo
    end


    private

    # params require a todo and permit the attributes of target and plan to be modified
    def todo_params
        params.require(:todo).permit(:target, :plan)
    end

    # we want an index of all transactions associated with a specific account
    # this runs before any of our routes above - because of before_action
    def set_todo
        @todo = Todo.find(params[:id])
    end
end
