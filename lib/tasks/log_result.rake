namespace :click do	
	desc '將 log 統計儲存至 RDS'
	task :log_result, [:minute] => [:environment] do |a, args|

		begin

			# 沒有傳入參數就以十分鐘為預設值
			args.with_defaults minute: 10

			$redis = Redis.new
			time_now = Time.now
			time_format = '%Y-%m-%d-%H-%M'

			(0..args[:minute].to_i).to_a.each do |index|

				# 每分鐘的時間格式
				time_past = time_now - ( index * 60 )

				data = $redis.lrange "#{time_past.strftime(time_format)}", 0, -1
				data.each do |log_id|

					# 從 redis 抓出 log 資料
					logs = $redis.hgetall "logs:#{log_id}"

					# 儲存原始 log
					log = Log.new
					log.redis_log_id = logs['id']
					log.ip = logs['ip']
					log.referer = logs['referer']
					log.agent = logs['agent']
					log.click_time = logs['click_time']
					log.token = logs['token']
					log.save

					# 加入 count 到該 task
					task = Task.find_by(token: logs['token'])
					if task
						task.click_count = task.click_count + 1
						task.save
					end
				end
			end

		rescue
			error = TaskErrorLog.new
			error.description = $!
			error.task_name = :log_result
			error.save
			p $!
		end

	end
end