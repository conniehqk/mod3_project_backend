class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :budget
      t.datetime :start_date
      t.datetime :end_date
      t.string :participants
    end
  end
end
