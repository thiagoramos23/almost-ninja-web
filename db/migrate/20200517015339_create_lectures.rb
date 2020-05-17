class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :video_url
      t.string :title
      t.string :description
      t.references :course, null: false, foreign_key: true
      t.bigint :parent_lecture_id
    end

    add_foreign_key :lectures, :lectures, column: :parent_lecture_id
  end
end
