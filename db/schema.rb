# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_22_060106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crate_songs", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "crate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crate_id"], name: "index_crate_songs_on_crate_id"
    t.index ["song_id"], name: "index_crate_songs_on_song_id"
  end

  create_table "crates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_crates_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.integer "bpm"
    t.string "instruments"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.bigint "remix_id"
    t.bigint "base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_id"], name: "index_sources_on_base_id"
    t.index ["remix_id"], name: "index_sources_on_remix_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "artist_name"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "crate_songs", "crates"
  add_foreign_key "crate_songs", "songs"
  add_foreign_key "crates", "users"
  add_foreign_key "songs", "users"
  add_foreign_key "sources", "songs", column: "base_id"
  add_foreign_key "sources", "songs", column: "remix_id"
end
