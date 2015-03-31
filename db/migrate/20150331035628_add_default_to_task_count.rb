class AddDefaultToTaskCount < ActiveRecord::Migration
  def change
  	change_column :tasks, :count, :integer, default: 0
  end
end
