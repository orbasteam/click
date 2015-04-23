class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :ip
      t.string :referer
      t.text :agent
      t.datetime :click_time
      t.string :token

      t.timestamps null: false
    end
  end
end
