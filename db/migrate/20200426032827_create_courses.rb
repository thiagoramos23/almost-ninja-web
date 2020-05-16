class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string  :name, null: false
      t.string  :description, null: false
      t.string  :html_description, null: false
      t.string  :learning_subjects, null: false
      t.string  :needed_knowledge, null: false
      t.string  :intro_video_url, null: false
      t.integer :length
      t.integer :total_lectures
      t.integer :total_repositories

      add_reference :courses, :author, null: true, foreign_key: true
      t.timestamps
    end
  end
end
