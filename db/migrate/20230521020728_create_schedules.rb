class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :task
      t.string :remaining
      t.integer :status, null: false, default: 0
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
