class AddCountToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :click_count, :integer, default: 0
  end
end
