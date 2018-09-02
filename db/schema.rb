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

ActiveRecord::Schema.define(version: 20180902173302) do

  create_table "desidered_books", force: :cascade do |t|
    t.string "nome"
    t.string "autore"
    t.string "genere"
    t.integer "anno"
    t.integer "ISBN"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_desidered_books_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer "mittente_id"
    t.integer "destinatario_id"
    t.string "libromittente"
    t.string "librodestinatario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destinatario_id"], name: "index_exchanges_on_destinatario_id"
    t.index ["mittente_id"], name: "index_exchanges_on_mittente_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.integer "mittente_id"
    t.integer "destinatario_id"
    t.integer "libromittente_id"
    t.integer "librodestinatario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destinatario_id"], name: "index_proposals_on_destinatario_id"
    t.index ["librodestinatario_id"], name: "index_proposals_on_librodestinatario_id"
    t.index ["libromittente_id"], name: "index_proposals_on_libromittente_id"
    t.index ["mittente_id"], name: "index_proposals_on_mittente_id"
  end

  create_table "proposed_books", force: :cascade do |t|
    t.string "nome"
    t.string "autore"
    t.string "genere"
    t.string "stato"
    t.integer "anno"
    t.integer "ISBN"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_proposed_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "annonascita"
    t.string "indirizzo"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
