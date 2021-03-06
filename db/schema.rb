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

ActiveRecord::Schema.define(version: 2020_03_03_151010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Articles_Categories", id: false, force: :cascade do |t|
    t.bigint "Article_id", null: false
    t.bigint "Category_id", null: false
    t.bigint "article_id"
    t.bigint "category_id"
    t.index ["article_id"], name: "index_Articles_Categories_on_article_id"
    t.index ["category_id"], name: "index_Articles_Categories_on_category_id"
  end

  create_table "answer_options", force: :cascade do |t|
    t.text "text"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answer_options_on_question_id"
  end

  create_table "answer_users", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.bigint "answer_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_option_id"], name: "index_answer_users_on_answer_option_id"
    t.index ["survey_id"], name: "index_answer_users_on_survey_id"
    t.index ["user_id"], name: "index_answer_users_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "attachments"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "text"
  end

  create_table "notes", force: :cascade do |t|
    t.string "message"
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "publications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "published_type"
    t.bigint "published_id"
    t.index ["published_type", "published_id"], name: "index_publications_on_published_type_and_published_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "survey_name"
    t.text "survey_desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verifieds", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.datetime "date"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_verifieds_on_article_id"
    t.index ["user_id"], name: "index_verifieds_on_user_id"
  end

  create_table "welcomes", force: :cascade do |t|
    t.string "salute"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "Articles_Categories", "articles"
  add_foreign_key "Articles_Categories", "categories"
  add_foreign_key "answer_options", "questions"
  add_foreign_key "answer_users", "answer_options"
  add_foreign_key "answer_users", "surveys"
  add_foreign_key "answer_users", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "questions", "surveys"
  add_foreign_key "verifieds", "articles"
  add_foreign_key "verifieds", "users"
end
