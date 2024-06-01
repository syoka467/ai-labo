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

ActiveRecord::Schema.define(version: 2024_05_28_110129) do

  create_table "ai_products", force: :cascade do |t|
    t.string "company_name"
    t.string "capital"
    t.string "establishment_date"
    t.string "employee_type"
    t.text "business_description"
    t.string "product_name"
    t.text "description"
    t.string "usage_fee_type"
    t.integer "usage_fee"
    t.string "initial_cost"
    t.boolean "free_plan"
    t.boolean "trial"
    t.text "faq"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "initial_cost_search"
    t.integer "initial_cost_display"
    t.string "usag_fee_scrape"
  end

  create_table "ai_products_categories", force: :cascade do |t|
    t.integer "ai_prodcut_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ai_products_purposes", force: :cascade do |t|
    t.integer "ai_product_id"
    t.integer "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ai_products_target_companies", force: :cascade do |t|
    t.integer "ai_product_id"
    t.integer "target_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ai_products_target_industries", force: :cascade do |t|
    t.integer "ai_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_industry_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_gpt_ai_products_introductions", force: :cascade do |t|
    t.integer "ai_product_id"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purposes", force: :cascade do |t|
    t.string "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_companies", force: :cascade do |t|
    t.string "target_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_industries", force: :cascade do |t|
    t.string "target_industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
