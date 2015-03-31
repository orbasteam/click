class AddDescriptionToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :description, :text, default: nil
  end
end
