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

ActiveRecord::Schema.define(version: 2019_12_08_200751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "image"
    t.string "sex"
    t.bigint "shelter_id"
    t.string "description"
    t.boolean "adoptable", default: true
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "shelter_reviews", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.text "review"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shelter_id", null: false
    t.index ["shelter_id"], name: "index_shelter_reviews_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
  end

  add_foreign_key "pets", "shelters"
  add_foreign_key "shelter_reviews", "shelters"
end
