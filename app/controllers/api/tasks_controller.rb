module Api
  class TasksController < ApplicationController
    def index
      render json: Task.all
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        render json: { message: "Task was successfully created." }, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    private

    def task_params
      params.require(:task).permit(:name, :description, :start_datetime, :end_datetime)
    end
  end
end
