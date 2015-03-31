
module Api
  class V1 < Sinatra::Application
    get '/:channel/:token' do
    	begin
    		
    		task = Task.includes(:channel).where(token: params[:token], channels: { name: params[:channel] })
    		if !task.exists?
    			raise 'data error'
    		end

    		task = task.take
    		task.count++
    		task.save

    	rescue
    		puts $!
    	end
    end
  end
end