class AddUniqueForChannelsName < ActiveRecord::Migration
  def change
  	change_column :channels, :name, :unique
  end
end
