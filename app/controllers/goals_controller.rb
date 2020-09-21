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

    # permanently delete an goal after finding it by id
    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        render json: @goal
    end


    private

    # params require an goal and permit the attribute of description to be modified
    def goal_params
        params.require(:goal).permit(:description)
    end

    # finds a todo by id
    def set_todo
        @todo = Todo.find_by(id: params[:todo_id])
    end

    # finds goal which belongs to a todo by id
    def set_goal
        @goal = @todo.goals.find_by(id: params[:id])
    end
end
