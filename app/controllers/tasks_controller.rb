class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # coloca la em baixo
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # usamos o metodo no private que esta em baixo para deixar prote
    @task.save
    redirect_to task_path(@task)
    # @task entre parentes é a nova task criada.
  end

  def edit
    # ta no codigo de cima e baixo no repit our self
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:title, :details)
  end
end
