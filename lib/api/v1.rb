
module Api
  class V1 < Sinatra::Application
    get '/:token' do
    	begin
    		
    		task = Task.where(token: params[:token])
    		if !task.exists?
    			raise 'data error'
    		end

          id = $redis.incr 'logs'

          $redis.mapped_hmset "logs:#{id}", {
            id: id,
            ip: request.env['REMOTE_ADDR'],
            referer: request.env['HTTP_REFERER'],
            agent: request.env['HTTP_USER_AGENT'],
            token: params[:token],
            click_time: Time.now.strftime('%Y/%m/%d %H:%M:%S')
          }

          # add timestamp key
          t = Time.now
          time_key = t.strftime('%Y-%m-%d-%H-%M')
          $redis.rpush time_key, id

          # 測試先不用導向
          # redirect task.take.target_url

    	rescue
    		p $!
    	end
    end
  end
end