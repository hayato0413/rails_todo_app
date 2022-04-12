class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to tasks_path
    else
      flash[:error] = "スケジュールを登録できませんでした"
      render "new", status: :unprocessable_entity
    end
    
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "スケジュールを更新しました"
      redirect_to tasks_path
    else
      flash[:error] = "スケジュールを更新できませんでした"
      render "tasks/edit", status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "スケジュールを削除しました"
      redirect_to tasks_path
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private
    def task_params
      params.require(:task).permit(:title, :startday, :endday, :everyday, :memo)
    end      
end
