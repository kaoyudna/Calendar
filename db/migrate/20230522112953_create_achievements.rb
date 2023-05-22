class CreateAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements do |t|
      t.references :schedule, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
