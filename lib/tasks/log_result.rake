namespace :click do	
	desc '將 log 統計儲存至 RDS'
	task :log_result, :minute do |a, args|

		args.with_defaults minute: 10

		$redis = Redis.new

		time_array = Time.now.strftime('%Y-%m-%d-%H-%M').split('-')
    minute = time_array.last.to_i
    time_array = time_array.first time_array.size - 1

		(0..args[:minute].to_i).to_a.each do |index|
			new_minute = minute. - index.to_i

			break if new_minute <= 0

			data = $redis.lrange "#{time_array.join('-')}-#{new_minute}", 0, -1
			data.each do |log_id|
				log = $redis.hgetall "logs:#{log_id}"
				p log
			end
		end
	end
end