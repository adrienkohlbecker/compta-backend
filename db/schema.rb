# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160411135657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "boursorama_id"
    t.string   "url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "currency_quotations", force: :cascade do |t|
    t.integer  "currency_id"
    t.date     "date"
    t.decimal  "value",       precision: 15, scale: 5
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "currency_quotations", ["currency_id", "date"], name: "index_currency_quotations_on_name_and_date", using: :btree
  add_index "currency_quotations", ["date"], name: "index_currency_quotations_on_date", using: :btree

  create_table "euro_funds", force: :cascade do |t|
    t.string   "name"
    t.string   "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interest_rates", force: :cascade do |t|
    t.integer  "object_id"
    t.string   "object_type"
    t.decimal  "minimal_rate",    precision: 15, scale: 5
    t.date     "from"
    t.date     "to"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.decimal  "served_rate",     precision: 15, scale: 5
    t.decimal  "social_tax_rate", precision: 15, scale: 5
    t.integer  "year_length"
  end

  create_table "opcvm_funds", force: :cascade do |t|
    t.string   "isin"
    t.string   "name"
    t.string   "boursorama_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "currency"
    t.boolean  "closed",        default: false, null: false
    t.date     "closed_date"
  end

  create_table "opcvm_quotations", force: :cascade do |t|
    t.integer  "opcvm_fund_id"
    t.decimal  "value_original", precision: 15, scale: 5
    t.date     "date"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "value_currency"
    t.date     "value_date"
  end

  add_index "opcvm_quotations", ["date"], name: "index_opcvm_quotations_on_date", using: :btree
  add_index "opcvm_quotations", ["opcvm_fund_id", "date"], name: "index_opcvm_quotations_on_date_and_fund", using: :btree

  create_table "portfolio_transactions", force: :cascade do |t|
    t.integer  "fund_id"
    t.decimal  "shares",              precision: 15, scale: 5
    t.integer  "portfolio_id"
    t.date     "done_at"
    t.decimal  "amount_original",     precision: 15, scale: 5
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "amount_currency"
    t.date     "amount_date"
    t.string   "fund_type"
    t.string   "category"
    t.decimal  "shareprice_original", precision: 15, scale: 5
    t.date     "shareprice_date"
    t.string   "shareprice_currency"
  end

  add_index "portfolio_transactions", ["done_at"], name: "index_portfolio_transactions_on_date", using: :btree
  add_index "portfolio_transactions", ["fund_id", "fund_type", "done_at"], name: "index_portfolio_transactions_on_date_and_fund", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "currency_quotations", "currencies"
  add_foreign_key "opcvm_quotations", "opcvm_funds"
  add_foreign_key "portfolio_transactions", "portfolios"
end
