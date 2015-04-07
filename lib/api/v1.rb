
module Api
  class V1 < Sinatra::Application
    get '/:channel/:token' do
    	begin
    		
    		task = Task.includes(:channel).where(token: params[:token], channels: { name: params[:channel] })

    		if !task.exists?
    			raise 'data error'
    		end

    		task = task.take

            log = Log.new
            log.task_id = task.id
            log.ip = request.env['REMOTE_ADDR']
            log.save

            redirect task.target_url

    	rescue
    		p $!
    	end
    end
  end
end