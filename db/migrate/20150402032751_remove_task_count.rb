class RemoveTaskCount < ActiveRecord::Migration
  def change
  	remove_column :tasks, :count
  end
end
