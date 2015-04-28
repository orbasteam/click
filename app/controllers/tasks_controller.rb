class TasksController < ApplicationController


	before_action :task_params, only: [:edit, :update, :destroy]
	before_action :set_channels, only: [:index, :edit, :new]

  def index
  	@tasks = Task.includes(:channel)
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(task_data)
  	if @task.save
  		redirect_to tasks_path, flash: { notice: 'Create successfuly' }
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @task.update(task_data)
  		redirect_to tasks_path, flash: { notice: 'Update successfuly' }
  	else
  		render :edit
  	end
  end

  def destroy
  	if @task.destroy
  		message = 'Destroy successfuly'
  	else
  		message = 'Destroy error'
  	end
  	redirect_to tasks_path, flash: { notice: message }
  end

  private
  	def task_params
  		@task = Task.find_by(id: params[:id])
  	end

  	def set_channels
  		@channels = Channel.all
  	end

  	def task_data
  		params.require(:task).permit(:name, :channel_id, :target_url, :description)
  	end
end
