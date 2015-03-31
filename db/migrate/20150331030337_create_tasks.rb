class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :channel, index: true, foreign_key: true
      t.string :name
      t.text :target_url
      t.integer :count

      t.timestamps null: false
    end
  end
end
