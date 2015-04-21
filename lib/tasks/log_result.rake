namespace :click do	
	desc '將 log 統計儲存至 RDS'
	task :log_result do

		$redis = Redis.new

		t = Time.now
		time_key = t.strftime('%Y-%m-%d-%H-%M')
		time_array = time_key.split('-')
    minute = time_array.last
    time_array = time_array.first time_array.size - 1

		(0..10).to_a.each do |index|
			new_minute = minute.to_i - index.to_i
			data = $redis.lrange "#{time_array.join('-')}-#{new_minute}", 0, -1
			data.each do |log_id|
				log = $redis.hgetall "logs:#{log_id}"
				p log
			end
		end
	end
end