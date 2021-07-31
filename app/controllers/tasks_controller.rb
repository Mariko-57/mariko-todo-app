class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
    @board = @task.board
    @comments = @task.comments
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build(user_id: current_user.id)
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params.merge!(user_id: current_user.id))
    if @task.save
      redirect_to board_path(board), notice: '新しいTaskが作成されました'
    else
      flash.now[:error] = 'Taskの作成に失敗しました'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(board_params)
      redirect_to task_path(@task), notice: '更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :eyecatch)
  end
end