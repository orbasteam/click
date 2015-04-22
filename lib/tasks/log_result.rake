namespace :click do	
	desc '將 log 統計儲存至 RDS'
	task :log_result, :minute do |a, args|

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
				logs = $redis.hgetall "logs:#{log_id}"
				puts logs['id']
			end
		end
	end
end