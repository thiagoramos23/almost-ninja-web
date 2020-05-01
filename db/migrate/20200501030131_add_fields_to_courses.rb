class AddFieldsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :total_classes, :integer
    add_column :courses, :total_repositories, :integer
    add_column :courses, :learning_subjects, :string
    add_column :courses, :needed_knowledge, :string
  end
end
