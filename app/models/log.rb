class Log < ActiveRecord::Base
	def assemble_log(logs)
		self.redis_log_id = logs['id']
		self.ip = logs['ip']
		self.referer = logs['referer']
		self.agent = logs['agent']
		self.click_time = logs['click_time']
		self.token = logs['token']
	end
end
