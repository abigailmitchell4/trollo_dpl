
class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy, :completed, :clear_tasks]

  def index
    @tasks = Task.all_tasks(current_user.id)
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy 
    redirect_to board_list_path(@list.board_id, @list)
  end

  def completed_tasks
    Task.find(params[:id]).update_attribute(:completed, true)
    redirect_to board_list_path(@list.board_id, @list)
  end

  def clear_tasks
    if @task.completed == true
       @task.destroy
       redirect_to board_list_path(@list.board_id, @list)
    else
      redirect_to board_list_path(@list.board_id, @list)
    end
  end


  private
    def set_list
    
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:task_name, :task_priority, :description, :completed)
    end

end