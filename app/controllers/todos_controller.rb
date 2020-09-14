class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :destroy, :toggle]

    def index
        @todos = Todo.all
        render json: @todos
    end

    def show
        render json: @todo
    end

    def create
        @todo = Todo.create(todo_params)
        render json: @todo
    end

    def destroy
        @todo.destroy
        render json: @todo
    end

    def toggle
        @todo.toggle!(:completed)
        render json: @todo
    end

    private

    def todo_params
        params.require(:todo).permit(:target, :plan)
    end


    def set_todo
        @todo = Todo.find(params[:id])
    end
end
