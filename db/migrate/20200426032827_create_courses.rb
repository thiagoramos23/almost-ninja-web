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
      t.integer :total_classes
      t.integer :total_repositories

      t.timestamps
    end
  end
end
