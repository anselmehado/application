class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update,:destroy ]
    def index
      @tasks = Task.all
    end
    def new
        @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if params[:back]
        render :new
        else
          if @task.save
            redirect_to tasks_path, notice: "creation d'une tache"
          else
            render :new
          end
        end
      end

    def show
    end
    def edit

    end
    def destroy
      @task = Task.find(params[:id])
      if @task.delete
        flash[:notice] = 'la tache est supprimee!'
        redirect_to root_path
      else
        flash[:error] = 'Failed to delete this task!'
        render :destroy
    end
  end
    def update
      @task = Task.find(params[:id])   # Overlap!
      if @task.update(task_params)
        redirect_to tasks_path, notice: "I edited the task!"
      else
        render :edit
      end
    end
    def destroy
      @task.destroy
      redirect_to tasks_path, notice:"I deleted the task!"
    end
    private
    def task_params
      params.require(:task).permit(:name, :content, :deadline, :status, :orderTask)
    end
    def set_task
          @task = Task.find(params[:id])
    end
end
