class AddRedisIdToLogs < ActiveRecord::Migration
  def change
  	add_column :logs, :redis_log_id, :string, default: nil
  end
end
