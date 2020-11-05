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

ActiveRecord::Schema.define(version: 2020_11_05_080726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
  end

  create_table "categories_courses", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_courses_on_category_id"
    t.index ["course_id"], name: "index_categories_courses_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
  end

  create_table "courses_learning_modules", id: false, force: :cascade do |t|
    t.bigint "learning_module_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_courses_modules_on_course_id"
    t.index ["learning_module_id"], name: "index_courses_modules_on_learning_module_id"
  end

  create_table "learning_module_popularities", force: :cascade do |t|
    t.date "period_start", null: false
    t.bigint "learning_module_id", null: false
    t.integer "use_count", null: false
    t.index ["learning_module_id"], name: "index_learning_module_popularities_on_learning_module_id"
  end

  create_table "learning_modules", force: :cascade do |t|
    t.string "name", null: false
    t.integer "module_type", null: false
    t.text "description"
    t.integer "difficulty", null: false
  end

end
