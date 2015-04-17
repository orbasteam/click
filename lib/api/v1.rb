
module Api
  class V1 < Sinatra::Application
    get '/:token' do
    	begin
    		
    		task = Task.where(token: params[:token])
    		if !task.exists?
    			raise 'data error'
    		end

          #(1..50).to_a.each do |num|
          #  $redis.del "logs:#{num}"
          #end

          id = $redis.incr 'logs'
          $redis.mapped_hmset "logs:#{id}", { id: id, ip: request.env['REMOTE_ADDR'], token: params[:token], click_time: Time.now.strftime("%Y/%m/%d %H:%M:%S") };
          # redirect task.take.target_url

    	rescue
    		p $!
    	end
    end
  end
end