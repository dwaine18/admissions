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

ActiveRecord::Schema.define(version: 2021_03_09_174235) do

  create_table "adcoms", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "school_id", null: false
    t.integer "user_id"
    t.index ["school_id"], name: "index_adcoms_on_school_id"
    t.index ["user_id"], name: "index_adcoms_on_user_id"
  end


  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "adcom_id", null: false
    t.integer "student_app_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adcom_id"], name: "index_comments_on_adcom_id"
    t.index ["student_app_id"], name: "index_comments_on_student_app_id"
  end


  create_table "programs", force: :cascade do |t|
    t.string "program_name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "school_id", null: false
    t.integer "category_id"
    t.index ["school_id"], name: "index_programs_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_apps", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "program_id", null: false
    t.text "essay"
    t.string "status"
    t.integer "score1"
    t.integer "score2"
    t.boolean "completestat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_student_apps_on_program_id"
    t.index ["student_id"], name: "index_student_apps_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "sat_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type"
    t.integer "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adcoms", "schools"
  add_foreign_key "adcoms", "users"
  add_foreign_key "applications", "program_ids"
  add_foreign_key "applications", "student_ids"
  add_foreign_key "comments", "adcoms"
  add_foreign_key "comments", "student_apps"
  add_foreign_key "essay2s", "student_ids"
  add_foreign_key "essays", "school_ids"
  add_foreign_key "programs", "schools"
  add_foreign_key "student_apps", "programs"
  add_foreign_key "student_apps", "students"
  add_foreign_key "students", "users"
end
