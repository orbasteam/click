
module Api
  class V1 < Sinatra::Application
    get '/:token' do
    	begin

    		task = Task.where(token: params[:token])
    		if !task.exists?
    			raise "token : #{params[:token]}, task doesn't exists"
    		end

          id = $redis.incr 'logs'

          # 紀錄此次點擊 log
          $redis.mapped_hmset "logs:#{id}", {
            id: id,
            ip: request.env['REMOTE_ADDR'],
            referer: request.env['HTTP_REFERER'],
            agent: request.env['HTTP_USER_AGENT'],
            token: params[:token],
            click_time: Time.now.to_s(:click)
          }

          # add timestamp key
          $redis.rpush Time.minute_idx, id

          # 測試先不用導向
          # redirect task.take.target_url

    	rescue
        # 紀錄錯誤 log 並導向 FG 首頁
        error = TaskErrorLog.new
        error.description = $!
        error.task_name = :v1_entrance
        error.save
        redirect 'http://www.fashionguide.com.tw/'
    	end
    end
  end
end
