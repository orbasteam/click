class TasksController < ApplicationController

	before_action :set_data, only: [:edit, :update, :destroy]
	before_action :set_channels, only: [:edit, :new]

  def index
  	@tasks = Task.includes(:channel)
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(clean_data)
  	if @task.save
  		redirect_to tasks_path, flash: { notice: 'Create successfuly' }
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @task.update(clean_data)
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
  	def set_data
  		@task = Task.find_by(id: params[:id])
  	end

  	def set_channels
  		@channels = Channel.all
  	end

  	def clean_data
  		params.require(:task).permit(:name, :channel_id, :target_url, :description)
  	end
end
