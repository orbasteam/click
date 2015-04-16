
module Api
  class V1 < Sinatra::Application
    get '/:token' do
    	begin
    		
    		task = Task.where(token: params[:token])
    		if !task.exists?
    			raise 'data error'
    		end

            pk = $redis.incr 'logs'
            $redis.hset 'logs', params[:token];
            puts 'done'
            # redirect task.take.target_url

    	rescue
    		p $!
    	end
    end
  end
end