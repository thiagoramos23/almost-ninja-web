# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_023820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "html_description", null: false
    t.string "learning_subjects", null: false
    t.string "needed_knowledge", null: false
    t.string "intro_video_url", null: false
    t.integer "length"
    t.integer "total_lectures"
    t.integer "total_repositories"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "author_id"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "video_url"
    t.string "title"
    t.string "description"
    t.bigint "course_id", null: false
    t.bigint "parent_lecture_id"
    t.index ["course_id"], name: "index_lectures_on_course_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "taggable_type", null: false
    t.bigint "taggable_id", null: false
    t.string "name"
    t.index ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "courses", "users", column: "author_id"
  add_foreign_key "lectures", "courses"
  add_foreign_key "lectures", "lectures", column: "parent_lecture_id"
end
