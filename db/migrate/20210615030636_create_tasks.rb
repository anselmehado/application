class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.date :deadline
      t.string :status
      t.integer :orderTask 
    end
  end
end
