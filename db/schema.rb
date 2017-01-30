# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170130130932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_translations", force: :cascade do |t|
    t.integer  "answer_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
    t.index ["answer_id"], name: "index_answer_translations_on_answer_id", using: :btree
    t.index ["locale"], name: "index_answer_translations_on_locale", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "correct"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "answers_responses", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "response_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["answer_id"], name: "index_answers_responses_on_answer_id", using: :btree
    t.index ["response_id"], name: "index_answers_responses_on_response_id", using: :btree
  end

  create_table "attempts", force: :cascade do |t|
    t.integer  "student_id"
    t.float    "score"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "quiz_permutation_id"
    t.boolean  "completed",           default: false
    t.index ["quiz_permutation_id"], name: "index_attempts_on_quiz_permutation_id", using: :btree
    t.index ["student_id"], name: "index_attempts_on_student_id", using: :btree
  end

  create_table "course_translations", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "course_name"
    t.index ["course_id"], name: "index_course_translations_on_course_id", using: :btree
    t.index ["locale"], name: "index_course_translations_on_locale", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.string   "course_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses_semesters", force: :cascade do |t|
    t.integer  "semester_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id"], name: "index_courses_semesters_on_course_id", using: :btree
    t.index ["semester_id"], name: "index_courses_semesters_on_semester_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "professor_id"
    t.integer  "group_id"
    t.string   "name"
    t.integer  "courses_semester_id"
    t.index ["courses_semester_id"], name: "index_groups_on_courses_semester_id", using: :btree
    t.index ["professor_id"], name: "index_groups_on_professor_id", using: :btree
  end

  create_table "groups_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_students_on_group_id", using: :btree
    t.index ["student_id"], name: "index_groups_students_on_student_id", using: :btree
  end

  create_table "professor_translations", force: :cascade do |t|
    t.integer  "professor_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.index ["locale"], name: "index_professor_translations_on_locale", using: :btree
    t.index ["professor_id"], name: "index_professor_translations_on_professor_id", using: :btree
  end

  create_table "professors", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "professor_id"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_professors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_professors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "question_categories", force: :cascade do |t|
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "weight",                 default: 1.0
    t.integer  "quiz_id"
    t.integer  "questions_per_category", default: 1
    t.index ["quiz_id"], name: "index_question_categories_on_quiz_id", using: :btree
  end

  create_table "question_permutations", force: :cascade do |t|
    t.integer  "quiz_permutation_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "question_id"
    t.integer  "question_category_id"
    t.index ["question_category_id"], name: "index_question_permutations_on_question_category_id", using: :btree
    t.index ["question_id"], name: "index_question_permutations_on_question_id", using: :btree
    t.index ["quiz_permutation_id"], name: "index_question_permutations_on_quiz_permutation_id", using: :btree
  end

  create_table "question_translations", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "content"
    t.index ["locale"], name: "index_question_translations_on_locale", using: :btree
    t.index ["question_id"], name: "index_question_translations_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "question_category_id"
    t.index ["question_category_id"], name: "index_questions_on_question_category_id", using: :btree
  end

  create_table "quiz_permutations", force: :cascade do |t|
    t.integer  "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "group_id"
    t.index ["group_id"], name: "index_quiz_permutations_on_group_id", using: :btree
    t.index ["quiz_id"], name: "index_quiz_permutations_on_quiz_id", using: :btree
    t.index ["student_id"], name: "index_quiz_permutations_on_student_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "active"
    t.float    "total_weight", default: 0.0
    t.integer  "group_id"
    t.datetime "expires_at"
    t.index ["group_id"], name: "index_quizzes_on_group_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "attempt_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "correct"
    t.index ["attempt_id"], name: "index_responses_on_attempt_id", using: :btree
    t.index ["question_id"], name: "index_responses_on_question_id", using: :btree
  end

  create_table "semesters", force: :cascade do |t|
    t.integer  "year"
    t.boolean  "academicterm"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "student_translations", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["locale"], name: "index_student_translations_on_locale", using: :btree
    t.index ["student_id"], name: "index_student_translations_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "student_id"
    t.index ["email"], name: "index_students_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "answers_responses", "answers"
  add_foreign_key "answers_responses", "responses"
  add_foreign_key "attempts", "quiz_permutations"
  add_foreign_key "attempts", "students"
  add_foreign_key "courses_semesters", "courses"
  add_foreign_key "courses_semesters", "semesters"
  add_foreign_key "groups", "courses_semesters"
  add_foreign_key "groups", "professors"
  add_foreign_key "question_categories", "quizzes"
  add_foreign_key "questions", "question_categories"
  add_foreign_key "quiz_permutations", "students"
  add_foreign_key "quizzes", "groups"
end
