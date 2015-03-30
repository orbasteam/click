class ChannelsController < ApplicationController

	before_action :set_data, only: [:edit, :update, :destroy]

	def index
		@channels = Channel.all
	end

	def new
		@channel = Channel.new
	end

	def create
		@channel = Channel.new(clean_data)
		if @channel.save
			redirect_to channels_path, flash: { notice: 'Create successfuly' }
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @channel.update(clean_data)
			redirect_to channels_path, flash: { notice: 'Update successfuly' }
		else
			render :edit
		end
	end

	def destroy
		if @channel.destroy
			flash[:notice] = 'Delete successfuly'
		else
			flash[:notice] = 'Delete error'
		end

		redirect_to channels_path
	end

	def show
	end

	private
		def clean_data
			params.require(:channel).permit(:name)
		end

		def set_data
			@channel = Channel.find_by(id: params[:id])
		end
end
