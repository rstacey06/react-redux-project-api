class GoalsController < ApplicationController
    before_action :set_todo
    before_action :set_goal, only: [:show]

    def index
        @goals = @todo.goals.all
        render json: @goals
    end

    def show
        @goal = Goal.find(params[:id])
        render json: @goal
    end

    def create
        @goal = @todo.goals.create(goal_params)
        render json: @goal
    end

    def toggle
        @goal = Goal.find(params[:id])
        @goal.toggle!(:completed)
        render json: @goal
    end

    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        render json: @goal
    end

    private

    def goal_params
        params.require(:goal).permit(:description)
    end

    def set_todo
        @todo = Todo.find_by(id: params[:todo_id])
    end

    def set_goal
        @goal = @todo.goals.find_by(id: params[:id])
    end
end
