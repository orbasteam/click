class ChannelsController < ApplicationController

	before_action :channel_params, only: [:edit, :update, :destroy]

	def index
		@channels = Channel.all
	end

	def new
		@channel = Channel.new
	end

	def create
		@channel = Channel.new(channel_data)
		if @channel.save
			redirect_to channels_path, flash: { notice: 'Create successfuly' }
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @channel.update(channel_data)
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
		def channel_data
			params.require(:channel).permit(:name)
		end

		def channel_params
			@channel = Channel.find_by(id: params[:id])
		end
end
