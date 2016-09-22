class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.belongs_to :goal, index: true
      t.belongs_to :user, index: true
      t.datetime :day
      t.integer :duration
      t.datetime :start_time
      t.datetime :end_time
      t.time :elapsed_time
      t.boolean :is_complete
      t.timestamps null: false
    end
  end
end
