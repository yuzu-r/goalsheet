class ChangePlans < ActiveRecord::Migration
  def change
     remove_column :plans, :elapsed_time
     add_column :plans, :elapsed_time_seconds, :integer
  end
end
