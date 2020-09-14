class GoalsController < ApplicationController
  # before any action, our set_todo and set_goal methods will run
    before_action :set_todo
    before_action :set_goal, only: [:show]

    # load all goals, which belong to a todo
    def index
      @goals = @todo.goals.all
      render json: @goals
    end

    # dispaly an goal by id
    def show
        @goal = Goal.find(params[:id])
        render json: @goal
    end

    # create a new goal, nested under a todo
    def create
        @goal = @todo.goals.create(goal_params)
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
