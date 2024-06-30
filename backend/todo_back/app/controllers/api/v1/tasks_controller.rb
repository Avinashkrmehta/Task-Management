class Api::V1::TasksController < ApplicationController
  before_action :authenticate_request
  before_action :set_task, only: [:show, :update, :destroy]
  after_action :verify_authorized

  def index
    @tasks = policy_scope(Task).where(user: current_user)
    authorize @tasks

    if params[:status].present?
      @tasks = @tasks.where(status: params[:status])
    end

    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    todo_tasks_count = current_user.tasks.where(status: :todo).count
    total_tasks_count = current_user.tasks.count

    if task_params[:status] == "To Do" && todo_tasks_count >= (total_tasks_count * 0.5)
      render json: { error: "Cannot create new 'To Do' task when it exceeds 50% of total tasks." }, status: :forbidden
      return
    end

    @task = current_user.tasks.new(task_params)
    authorize @task

    if @task.save
      render json: @task, status: :created, location: api_v1_task_url(@task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      head :no_content
    else
      render json: { error: 'Failed to delete the task' }, status: :unprocessable_entity
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  end
  