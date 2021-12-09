class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category, except: [:tasks_today]

    def index
        @tasks = @category.tasks
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        if @task.save
            redirect_to category_task_path(@category.id, @task.id)
        else
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to category_task_path(@category.id, @task.id)
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to category_path(@category.id)
    end

    def tasks_today
        @tasks = Task.where(task_date: Date.today)
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :body, :category_id, :task_date)
    end  
end

