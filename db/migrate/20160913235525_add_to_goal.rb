class AddToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :title, :string
    add_column :goals, :description, :text
    add_column :goals, :frequency, :integer
    add_column :goals, :session_length, :integer
  end
end
