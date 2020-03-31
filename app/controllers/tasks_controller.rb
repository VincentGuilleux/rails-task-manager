class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    @task.save

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
