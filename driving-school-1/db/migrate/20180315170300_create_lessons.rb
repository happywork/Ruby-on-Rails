class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.date :lesson_date
      t.time :lesson_time

      t.timestamps null: false
    end
  end
end
