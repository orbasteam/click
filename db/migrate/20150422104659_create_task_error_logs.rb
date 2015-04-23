class CreateTaskErrorLogs < ActiveRecord::Migration
  def change
    create_table :task_error_logs do |t|
      t.string :task_name
      t.text :description

      t.timestamps null: false
    end
  end
end
