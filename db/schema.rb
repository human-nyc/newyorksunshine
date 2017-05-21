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

ActiveRecord::Schema.define(version: 20170426163554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
    t.datetime "deleted_at"
  end

  add_index "friendly_id_slugs", ["deleted_at"], name: "index_friendly_id_slugs_on_deleted_at", using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "relation_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "applies_to",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "relation_type_id"
    t.integer  "relatable_id"
    t.string   "relatable_type",   limit: 255
    t.integer  "related_to_id"
    t.string   "related_to_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "discount_amount",              precision: 8, scale: 2, default: 0.0
  end

  create_table "spree_addresses", force: :cascade do |t|
    t.string   "firstname",         limit: 255
    t.string   "lastname",          limit: 255
    t.string   "address1",          limit: 255
    t.string   "address2",          limit: 255
    t.string   "city",              limit: 255
    t.string   "zipcode",           limit: 255
    t.string   "phone",             limit: 255
    t.string   "state_name",        limit: 255
    t.string   "alternative_phone", limit: 255
    t.string   "company",           limit: 255
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_addresses", ["country_id"], name: "index_spree_addresses_on_country_id", using: :btree
  add_index "spree_addresses", ["firstname"], name: "index_addresses_on_firstname", using: :btree
  add_index "spree_addresses", ["lastname"], name: "index_addresses_on_lastname", using: :btree
  add_index "spree_addresses", ["state_id"], name: "index_spree_addresses_on_state_id", using: :btree

  create_table "spree_adjustments", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "source_type",     limit: 255
    t.integer  "adjustable_id"
    t.string   "adjustable_type", limit: 255
    t.decimal  "amount",                      precision: 10, scale: 2
    t.string   "label",           limit: 255
    t.boolean  "mandatory"
    t.boolean  "eligible",                                             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",           limit: 255
    t.integer  "order_id",                                                             null: false
    t.boolean  "included",                                             default: false
  end

  add_index "spree_adjustments", ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type", using: :btree
  add_index "spree_adjustments", ["eligible"], name: "index_spree_adjustments_on_eligible", using: :btree
  add_index "spree_adjustments", ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
  add_index "spree_adjustments", ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type", using: :btree
  add_index "spree_adjustments", ["source_type", "source_id"], name: "index_spree_adjustments_on_source_type_and_source_id", using: :btree

  create_table "spree_assets", force: :cascade do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type",           limit: 255
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type", limit: 255
    t.string   "attachment_file_name",    limit: 255
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_assets", ["position"], name: "index_spree_assets_on_position", using: :btree
  add_index "spree_assets", ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
  add_index "spree_assets", ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree

  create_table "spree_calculators", force: :cascade do |t|
    t.string   "type",            limit: 255
    t.integer  "calculable_id"
    t.string   "calculable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
    t.datetime "deleted_at"
  end

  add_index "spree_calculators", ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type", using: :btree
  add_index "spree_calculators", ["deleted_at"], name: "index_spree_calculators_on_deleted_at", using: :btree
  add_index "spree_calculators", ["id", "type"], name: "index_spree_calculators_on_id_and_type", using: :btree

  create_table "spree_contents", force: :cascade do |t|
    t.text     "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_countries", force: :cascade do |t|
    t.string   "iso_name",         limit: 255
    t.string   "iso",              limit: 255
    t.string   "iso3",             limit: 255
    t.string   "name",             limit: 255
    t.integer  "numcode"
    t.boolean  "states_required",              default: false
    t.datetime "updated_at"
    t.boolean  "zipcode_required",             default: true
  end

  create_table "spree_credit_cards", force: :cascade do |t|
    t.string   "month",                       limit: 255
    t.string   "year",                        limit: 255
    t.string   "cc_type",                     limit: 255
    t.string   "last_digits",                 limit: 255
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id", limit: 255
    t.string   "gateway_payment_profile_id",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                        limit: 255
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.boolean  "default",                                 default: false, null: false
  end

  add_index "spree_credit_cards", ["address_id"], name: "index_spree_credit_cards_on_address_id", using: :btree
  add_index "spree_credit_cards", ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id", using: :btree
  add_index "spree_credit_cards", ["user_id"], name: "index_spree_credit_cards_on_user_id", using: :btree

  create_table "spree_customer_returns", force: :cascade do |t|
    t.string   "number",            limit: 255
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_feed_items", force: :cascade do |t|
    t.integer  "category"
    t.string   "href",                    limit: 255
    t.string   "superheading",            limit: 255
    t.string   "title",                   limit: 255
    t.integer  "position",                            default: 0, null: false
    t.integer  "product_id"
    t.integer  "post_id"
    t.integer  "lookbook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "spree_gateways", force: :cascade do |t|
    t.string   "type",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description"
    t.boolean  "active",                  default: true
    t.string   "environment", limit: 255, default: "development"
    t.string   "server",      limit: 255, default: "test"
    t.boolean  "test_mode",               default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
  end

  add_index "spree_gateways", ["active"], name: "index_spree_gateways_on_active", using: :btree
  add_index "spree_gateways", ["test_mode"], name: "index_spree_gateways_on_test_mode", using: :btree

  create_table "spree_inventory_units", force: :cascade do |t|
    t.string   "state",        limit: 255
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pending",                  default: true
    t.integer  "line_item_id"
  end

  add_index "spree_inventory_units", ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id", using: :btree
  add_index "spree_inventory_units", ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
  add_index "spree_inventory_units", ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
  add_index "spree_inventory_units", ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree

  create_table "spree_line_items", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                                        null: false
    t.decimal  "price",                                    precision: 10, scale: 2,               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",                     limit: 255
    t.decimal  "cost_price",                               precision: 10, scale: 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",                         precision: 10, scale: 2, default: 0.0
    t.decimal  "additional_tax_total",                     precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                              precision: 10, scale: 2, default: 0.0
    t.decimal  "included_tax_total",                       precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "pre_tax_amount",                           precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "tax_total",                                precision: 10, scale: 2, default: 0.0
    t.decimal  "taxable_adjustment_total",                 precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "non_taxable_adjustment_total",             precision: 10, scale: 2, default: 0.0, null: false
  end

  add_index "spree_line_items", ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
  add_index "spree_line_items", ["tax_category_id"], name: "index_spree_line_items_on_tax_category_id", using: :btree
  add_index "spree_line_items", ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree

  create_table "spree_log_entries", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "source_type", limit: 255
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_log_entries", ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type", using: :btree

  create_table "spree_lookbooks", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "slug",         limit: 255
    t.text     "content"
    t.datetime "available_on"
    t.boolean  "published",                default: true
    t.integer  "aspect_ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_option_type_prototypes", force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  add_index "spree_option_type_prototypes", ["option_type_id"], name: "index_spree_option_type_prototypes_on_option_type_id", using: :btree
  add_index "spree_option_type_prototypes", ["prototype_id", "option_type_id"], name: "index_option_types_prototypes_on_prototype_and_option_type", using: :btree

  create_table "spree_option_types", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_option_types", ["name"], name: "index_spree_option_types_on_name", using: :btree
  add_index "spree_option_types", ["position"], name: "index_spree_option_types_on_position", using: :btree

  create_table "spree_option_value_variants", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_value_variants", ["option_value_id"], name: "index_spree_option_value_variants_on_option_value_id", using: :btree
  add_index "spree_option_value_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree

  create_table "spree_option_values", force: :cascade do |t|
    t.integer  "position"
    t.string   "name",           limit: 255
    t.string   "presentation",   limit: 255
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_option_values", ["name"], name: "index_spree_option_values_on_name", using: :btree
  add_index "spree_option_values", ["option_type_id"], name: "index_spree_option_values_on_option_type_id", using: :btree
  add_index "spree_option_values", ["position"], name: "index_spree_option_values_on_position", using: :btree

  create_table "spree_order_promotions", force: :cascade do |t|
    t.integer "order_id"
    t.integer "promotion_id"
  end

  add_index "spree_order_promotions", ["order_id"], name: "index_spree_order_promotions_on_order_id", using: :btree
  add_index "spree_order_promotions", ["promotion_id", "order_id"], name: "index_spree_order_promotions_on_promotion_id_and_order_id", using: :btree

  create_table "spree_orders", force: :cascade do |t|
    t.string   "number",                       limit: 32
    t.decimal  "item_total",                               precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "total",                                    precision: 10, scale: 2, default: 0.0,     null: false
    t.string   "state",                        limit: 255
    t.decimal  "adjustment_total",                         precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                            precision: 10, scale: 2, default: 0.0
    t.string   "shipment_state",               limit: 255
    t.string   "payment_state",                limit: 255
    t.string   "email",                        limit: 255
    t.text     "special_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",                     limit: 255
    t.string   "last_ip_address",              limit: 255
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                           precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "additional_tax_total",                     precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                              precision: 10, scale: 2, default: 0.0
    t.string   "channel",                      limit: 255,                          default: "spree"
    t.decimal  "included_tax_total",                       precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "item_count",                                                        default: 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                            default: false
    t.boolean  "considered_risky",                                                  default: false
    t.string   "guest_token",                  limit: 255
    t.integer  "state_lock_version",                                                default: 0,       null: false
    t.decimal  "tax_total",                                precision: 10, scale: 2, default: 0.0
    t.datetime "canceled_at"
    t.integer  "canceler_id"
    t.integer  "store_id"
    t.decimal  "taxable_adjustment_total",                 precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "non_taxable_adjustment_total",             precision: 10, scale: 2, default: 0.0,     null: false
  end

  add_index "spree_orders", ["approver_id"], name: "index_spree_orders_on_approver_id", using: :btree
  add_index "spree_orders", ["bill_address_id"], name: "index_spree_orders_on_bill_address_id", using: :btree
  add_index "spree_orders", ["canceler_id"], name: "index_spree_orders_on_canceler_id", using: :btree
  add_index "spree_orders", ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
  add_index "spree_orders", ["confirmation_delivered"], name: "index_spree_orders_on_confirmation_delivered", using: :btree
  add_index "spree_orders", ["considered_risky"], name: "index_spree_orders_on_considered_risky", using: :btree
  add_index "spree_orders", ["created_by_id"], name: "index_spree_orders_on_created_by_id", using: :btree
  add_index "spree_orders", ["guest_token"], name: "index_spree_orders_on_guest_token", using: :btree
  add_index "spree_orders", ["number"], name: "index_spree_orders_on_number", using: :btree
  add_index "spree_orders", ["ship_address_id"], name: "index_spree_orders_on_ship_address_id", using: :btree
  add_index "spree_orders", ["store_id"], name: "index_spree_orders_on_store_id", using: :btree
  add_index "spree_orders", ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id", using: :btree

  create_table "spree_payment_capture_events", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: 0.0
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_payment_capture_events", ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id", using: :btree

  create_table "spree_payment_methods", force: :cascade do |t|
    t.string   "type",         limit: 255
    t.string   "name",         limit: 255
    t.text     "description"
    t.boolean  "active",                   default: true
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auto_capture"
    t.text     "preferences"
    t.string   "display_on",               default: "both"
    t.integer  "position",                 default: 0
  end

  add_index "spree_payment_methods", ["id", "type"], name: "index_spree_payment_methods_on_id_and_type", using: :btree

  create_table "spree_payments", force: :cascade do |t|
    t.decimal  "amount",                           precision: 10, scale: 2, default: 0.0, null: false
    t.integer  "order_id"
    t.integer  "source_id"
    t.string   "source_type",          limit: 255
    t.integer  "payment_method_id"
    t.string   "state",                limit: 255
    t.string   "response_code",        limit: 255
    t.string   "avs_response",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number",               limit: 255
    t.string   "cvv_response_code",    limit: 255
    t.string   "cvv_response_message", limit: 255
  end

  add_index "spree_payments", ["order_id"], name: "index_spree_payments_on_order_id", using: :btree
  add_index "spree_payments", ["payment_method_id"], name: "index_spree_payments_on_payment_method_id", using: :btree
  add_index "spree_payments", ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type", using: :btree

  create_table "spree_post_images", force: :cascade do |t|
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "post_id"
  end

  add_index "spree_post_images", ["post_id"], name: "index_spree_post_images_on_post_id", using: :btree

  create_table "spree_posts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "slug",         limit: 255
    t.datetime "published_on"
    t.string   "link_url",     limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "embed_code"
  end

  add_index "spree_posts", ["slug"], name: "index_spree_posts_on_slug", using: :btree

  create_table "spree_preferences", force: :cascade do |t|
    t.text     "value"
    t.string   "key",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_preferences", ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree

  create_table "spree_press_items", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "position"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "spree_press_items", ["position"], name: "index_spree_press_items_on_position", using: :btree

  create_table "spree_prices", force: :cascade do |t|
    t.integer  "variant_id",                                      null: false
    t.decimal  "amount",                 precision: 10, scale: 2
    t.string   "currency",   limit: 255
    t.datetime "deleted_at"
  end

  add_index "spree_prices", ["deleted_at"], name: "index_spree_prices_on_deleted_at", using: :btree
  add_index "spree_prices", ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree
  add_index "spree_prices", ["variant_id"], name: "index_spree_prices_on_variant_id", using: :btree

  create_table "spree_product_option_types", force: :cascade do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_product_option_types", ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id", using: :btree
  add_index "spree_product_option_types", ["position"], name: "index_spree_product_option_types_on_position", using: :btree
  add_index "spree_product_option_types", ["product_id"], name: "index_spree_product_option_types_on_product_id", using: :btree

  create_table "spree_product_promotion_rules", force: :cascade do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_product_promotion_rules", ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
  add_index "spree_product_promotion_rules", ["promotion_rule_id", "product_id"], name: "index_products_promotion_rules_on_promotion_rule_and_product", using: :btree

  create_table "spree_product_properties", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                default: 0
  end

  add_index "spree_product_properties", ["position"], name: "index_spree_product_properties_on_position", using: :btree
  add_index "spree_product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree
  add_index "spree_product_properties", ["property_id"], name: "index_spree_product_properties_on_property_id", using: :btree

  create_table "spree_products", force: :cascade do |t|
    t.string   "name",                 limit: 255, default: "",   null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug",                 limit: 255
    t.text     "meta_description"
    t.string   "meta_keywords",        limit: 255
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promotionable",                    default: true
    t.string   "meta_title",           limit: 255
    t.datetime "discontinue_on"
  end

  add_index "spree_products", ["available_on"], name: "index_spree_products_on_available_on", using: :btree
  add_index "spree_products", ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
  add_index "spree_products", ["discontinue_on"], name: "index_spree_products_on_discontinue_on", using: :btree
  add_index "spree_products", ["name"], name: "index_spree_products_on_name", using: :btree
  add_index "spree_products", ["shipping_category_id"], name: "index_spree_products_on_shipping_category_id", using: :btree
  add_index "spree_products", ["slug"], name: "index_spree_products_on_slug", unique: true, using: :btree
  add_index "spree_products", ["tax_category_id"], name: "index_spree_products_on_tax_category_id", using: :btree

  create_table "spree_products_taxons", force: :cascade do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
  end

  add_index "spree_products_taxons", ["position"], name: "index_spree_products_taxons_on_position", using: :btree
  add_index "spree_products_taxons", ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
  add_index "spree_products_taxons", ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree

  create_table "spree_promotion_action_line_items", force: :cascade do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            default: 1
  end

  add_index "spree_promotion_action_line_items", ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id", using: :btree
  add_index "spree_promotion_action_line_items", ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id", using: :btree

  create_table "spree_promotion_actions", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type",         limit: 255
    t.datetime "deleted_at"
  end

  add_index "spree_promotion_actions", ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at", using: :btree
  add_index "spree_promotion_actions", ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type", using: :btree
  add_index "spree_promotion_actions", ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id", using: :btree

  create_table "spree_promotion_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "spree_promotion_rule_taxons", force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rule_taxons", ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id", using: :btree
  add_index "spree_promotion_rule_taxons", ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id", using: :btree

  create_table "spree_promotion_rule_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rule_users", ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
  add_index "spree_promotion_rule_users", ["user_id", "promotion_rule_id"], name: "index_promotion_rules_users_on_user_id_and_promotion_rule_id", using: :btree

  create_table "spree_promotion_rules", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",             limit: 255
    t.text     "preferences"
  end

  add_index "spree_promotion_rules", ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
  add_index "spree_promotion_rules", ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id", using: :btree
  add_index "spree_promotion_rules", ["user_id"], name: "index_promotion_rules_on_user_id", using: :btree

  create_table "spree_promotions", force: :cascade do |t|
    t.string   "description",           limit: 255
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name",                  limit: 255
    t.string   "type",                  limit: 255
    t.integer  "usage_limit"
    t.string   "match_policy",          limit: 255, default: "all"
    t.string   "code",                  limit: 255
    t.boolean  "advertise",                         default: false
    t.string   "path",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_category_id"
  end

  add_index "spree_promotions", ["advertise"], name: "index_spree_promotions_on_advertise", using: :btree
  add_index "spree_promotions", ["code"], name: "index_spree_promotions_on_code", using: :btree
  add_index "spree_promotions", ["expires_at"], name: "index_spree_promotions_on_expires_at", using: :btree
  add_index "spree_promotions", ["id", "type"], name: "index_spree_promotions_on_id_and_type", using: :btree
  add_index "spree_promotions", ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id", using: :btree
  add_index "spree_promotions", ["starts_at"], name: "index_spree_promotions_on_starts_at", using: :btree

  create_table "spree_properties", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "presentation", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_properties", ["name"], name: "index_spree_properties_on_name", using: :btree

  create_table "spree_property_prototypes", force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  add_index "spree_property_prototypes", ["prototype_id", "property_id"], name: "index_properties_prototypes_on_prototype_and_property", using: :btree

  create_table "spree_prototype_taxons", force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "prototype_id"
  end

  add_index "spree_prototype_taxons", ["prototype_id", "taxon_id"], name: "index_spree_prototype_taxons_on_prototype_id_and_taxon_id", using: :btree
  add_index "spree_prototype_taxons", ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id", using: :btree

  create_table "spree_prototypes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refund_reasons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",                 default: true
    t.boolean  "mutable",                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refunds", force: :cascade do |t|
    t.integer  "payment_id"
    t.decimal  "amount",                       precision: 10, scale: 2, default: 0.0, null: false
    t.string   "transaction_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "refund_reason_id"
    t.integer  "reimbursement_id"
  end

  add_index "spree_refunds", ["refund_reason_id"], name: "index_refunds_on_refund_reason_id", using: :btree

  create_table "spree_reimbursement_credits", force: :cascade do |t|
    t.decimal "amount",                       precision: 10, scale: 2, default: 0.0, null: false
    t.integer "reimbursement_id"
    t.integer "creditable_id"
    t.string  "creditable_type",  limit: 255
  end

  create_table "spree_reimbursement_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",                 default: true
    t.boolean  "mutable",                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",       limit: 255
  end

  add_index "spree_reimbursement_types", ["type"], name: "index_spree_reimbursement_types_on_type", using: :btree

  create_table "spree_reimbursements", force: :cascade do |t|
    t.string   "number",               limit: 255
    t.string   "reimbursement_status", limit: 255
    t.integer  "customer_return_id"
    t.integer  "order_id"
    t.decimal  "total",                            precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_reimbursements", ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id", using: :btree
  add_index "spree_reimbursements", ["order_id"], name: "index_spree_reimbursements_on_order_id", using: :btree

  create_table "spree_relation_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "applies_to",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_relations", force: :cascade do |t|
    t.integer  "relation_type_id"
    t.integer  "relatable_id"
    t.string   "relatable_type",   limit: 255
    t.integer  "related_to_id"
    t.string   "related_to_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "discount_amount",              precision: 8, scale: 2, default: 0.0
    t.integer  "position"
  end

  create_table "spree_return_authorization_reasons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",                 default: true
    t.boolean  "mutable",                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_return_authorizations", force: :cascade do |t|
    t.string   "number",                         limit: 255
    t.string   "state",                          limit: 255
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_authorization_reason_id"
  end

  add_index "spree_return_authorizations", ["return_authorization_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id", using: :btree

  create_table "spree_return_items", force: :cascade do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pre_tax_amount",                              precision: 12, scale: 4, default: 0.0,  null: false
    t.decimal  "included_tax_total",                          precision: 12, scale: 4, default: 0.0,  null: false
    t.decimal  "additional_tax_total",                        precision: 12, scale: 4, default: 0.0,  null: false
    t.string   "reception_status",                limit: 255
    t.string   "acceptance_status",               limit: 255
    t.integer  "customer_return_id"
    t.integer  "reimbursement_id"
    t.integer  "exchange_inventory_unit_id"
    t.text     "acceptance_status_errors"
    t.integer  "preferred_reimbursement_type_id"
    t.integer  "override_reimbursement_type_id"
    t.boolean  "resellable",                                                           default: true, null: false
  end

  add_index "spree_return_items", ["customer_return_id"], name: "index_return_items_on_customer_return_id", using: :btree
  add_index "spree_return_items", ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id", using: :btree

  create_table "spree_role_users", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_role_users", ["role_id"], name: "index_spree_role_users_on_role_id", using: :btree
  add_index "spree_role_users", ["user_id"], name: "index_spree_role_users_on_user_id", using: :btree

  create_table "spree_roles", force: :cascade do |t|
    t.string "name", limit: 255
  end

  add_index "spree_roles", ["name"], name: "index_spree_roles_on_name", using: :btree

  create_table "spree_shipments", force: :cascade do |t|
    t.string   "tracking",                     limit: 255
    t.string   "number",                       limit: 255
    t.decimal  "cost",                                     precision: 10, scale: 2, default: 0.0
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state",                        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",                         precision: 10, scale: 2, default: 0.0
    t.decimal  "additional_tax_total",                     precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                              precision: 10, scale: 2, default: 0.0
    t.decimal  "included_tax_total",                       precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "pre_tax_amount",                           precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "tax_total",                                precision: 10, scale: 2, default: 0.0
    t.decimal  "taxable_adjustment_total",                 precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "non_taxable_adjustment_total",             precision: 10, scale: 2, default: 0.0, null: false
  end

  add_index "spree_shipments", ["address_id"], name: "index_spree_shipments_on_address_id", using: :btree
  add_index "spree_shipments", ["number"], name: "index_shipments_on_number", using: :btree
  add_index "spree_shipments", ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree
  add_index "spree_shipments", ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id", using: :btree

  create_table "spree_shipping_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_shipping_categories", ["name"], name: "index_spree_shipping_categories_on_name", using: :btree

  create_table "spree_shipping_method_categories", force: :cascade do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_shipping_method_categories", ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
  add_index "spree_shipping_method_categories", ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree

  create_table "spree_shipping_method_zones", force: :cascade do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_methods", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "display_on",      limit: 255
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_url",    limit: 255
    t.string   "admin_name",      limit: 255
    t.integer  "tax_category_id"
    t.string   "code",            limit: 255
  end

  add_index "spree_shipping_methods", ["deleted_at"], name: "index_spree_shipping_methods_on_deleted_at", using: :btree
  add_index "spree_shipping_methods", ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id", using: :btree

  create_table "spree_shipping_rates", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                   default: false
    t.decimal  "cost",               precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_rate_id"
  end

  add_index "spree_shipping_rates", ["selected"], name: "index_spree_shipping_rates_on_selected", using: :btree
  add_index "spree_shipping_rates", ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree
  add_index "spree_shipping_rates", ["tax_rate_id"], name: "index_spree_shipping_rates_on_tax_rate_id", using: :btree

  create_table "spree_skrill_transactions", force: :cascade do |t|
    t.string   "email",          limit: 255
    t.float    "amount"
    t.string   "currency",       limit: 255
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_slide_images", force: :cascade do |t|
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "slide_id"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "position"
  end

  add_index "spree_slide_images", ["slide_id"], name: "index_spree_slide_images_on_slide_id", using: :btree

  create_table "spree_slides", force: :cascade do |t|
    t.text     "embed_code"
    t.integer  "order"
    t.integer  "lookbook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "layout"
    t.integer  "position"
  end

  add_index "spree_slides", ["lookbook_id"], name: "index_spree_slides_on_lookbook_id", using: :btree

  create_table "spree_state_changes", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "previous_state", limit: 255
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type",  limit: 255
    t.string   "next_state",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_state_changes", ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type", using: :btree

  create_table "spree_states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "abbr",       limit: 255
    t.integer  "country_id"
    t.datetime "updated_at"
  end

  add_index "spree_states", ["country_id"], name: "index_spree_states_on_country_id", using: :btree

  create_table "spree_stock_items", force: :cascade do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
  end

  add_index "spree_stock_items", ["backorderable"], name: "index_spree_stock_items_on_backorderable", using: :btree
  add_index "spree_stock_items", ["deleted_at"], name: "index_spree_stock_items_on_deleted_at", using: :btree
  add_index "spree_stock_items", ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
  add_index "spree_stock_items", ["variant_id"], name: "index_spree_stock_items_on_variant_id", using: :btree

  create_table "spree_stock_locations", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address1",               limit: 255
    t.string   "address2",               limit: 255
    t.string   "city",                   limit: 255
    t.integer  "state_id"
    t.string   "state_name",             limit: 255
    t.integer  "country_id"
    t.string   "zipcode",                limit: 255
    t.string   "phone",                  limit: 255
    t.boolean  "active",                             default: true
    t.boolean  "backorderable_default",              default: false
    t.boolean  "propagate_all_variants",             default: true
    t.string   "admin_name",             limit: 255
    t.boolean  "default",                            default: false, null: false
  end

  add_index "spree_stock_locations", ["active"], name: "index_spree_stock_locations_on_active", using: :btree
  add_index "spree_stock_locations", ["backorderable_default"], name: "index_spree_stock_locations_on_backorderable_default", using: :btree
  add_index "spree_stock_locations", ["country_id"], name: "index_spree_stock_locations_on_country_id", using: :btree
  add_index "spree_stock_locations", ["propagate_all_variants"], name: "index_spree_stock_locations_on_propagate_all_variants", using: :btree
  add_index "spree_stock_locations", ["state_id"], name: "index_spree_stock_locations_on_state_id", using: :btree

  create_table "spree_stock_movements", force: :cascade do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",                    default: 0
    t.string   "action",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "originator_id"
    t.string   "originator_type", limit: 255
  end

  add_index "spree_stock_movements", ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree

  create_table "spree_stock_transfers", force: :cascade do |t|
    t.string   "type",                    limit: 255
    t.string   "reference",               limit: 255
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number",                  limit: 255
  end

  add_index "spree_stock_transfers", ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
  add_index "spree_stock_transfers", ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
  add_index "spree_stock_transfers", ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree

  create_table "spree_stockists", force: :cascade do |t|
    t.integer  "region"
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.string   "phone_number", limit: 255
    t.string   "link",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "spree_store_credit_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_store_credit_events", force: :cascade do |t|
    t.integer  "store_credit_id",                                          null: false
    t.string   "action",                                                   null: false
    t.decimal  "amount",             precision: 8, scale: 2
    t.string   "authorization_code",                                       null: false
    t.decimal  "user_total_amount",  precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "originator_id"
    t.string   "originator_type"
    t.datetime "deleted_at"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "spree_store_credit_events", ["originator_id", "originator_type"], name: "spree_store_credit_events_originator", using: :btree
  add_index "spree_store_credit_events", ["store_credit_id"], name: "index_spree_store_credit_events_on_store_credit_id", using: :btree

  create_table "spree_store_credit_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spree_store_credit_types", ["priority"], name: "index_spree_store_credit_types_on_priority", using: :btree

  create_table "spree_store_credits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "created_by_id"
    t.decimal  "amount",            precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "amount_used",       precision: 8, scale: 2, default: 0.0, null: false
    t.text     "memo"
    t.datetime "deleted_at"
    t.string   "currency"
    t.decimal  "amount_authorized", precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "originator_id"
    t.string   "originator_type"
    t.integer  "type_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "spree_store_credits", ["deleted_at"], name: "index_spree_store_credits_on_deleted_at", using: :btree
  add_index "spree_store_credits", ["originator_id", "originator_type"], name: "spree_store_credits_originator", using: :btree
  add_index "spree_store_credits", ["type_id"], name: "index_spree_store_credits_on_type_id", using: :btree
  add_index "spree_store_credits", ["user_id"], name: "index_spree_store_credits_on_user_id", using: :btree

  create_table "spree_stores", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "url",               limit: 255
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title",         limit: 255
    t.string   "mail_from_address", limit: 255
    t.string   "default_currency",  limit: 255
    t.string   "code",              limit: 255
    t.boolean  "default",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_stores", ["code"], name: "index_spree_stores_on_code", using: :btree
  add_index "spree_stores", ["default"], name: "index_spree_stores_on_default", using: :btree
  add_index "spree_stores", ["url"], name: "index_spree_stores_on_url", using: :btree

  create_table "spree_surf_club_images", force: :cascade do |t|
    t.integer  "position",                            default: -1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "spree_taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "spree_taggings", ["context"], name: "index_spree_taggings_on_context", using: :btree
  add_index "spree_taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "spree_taggings_idx", unique: true, using: :btree
  add_index "spree_taggings", ["tag_id"], name: "index_spree_taggings_on_tag_id", using: :btree
  add_index "spree_taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "spree_taggings_idy", using: :btree
  add_index "spree_taggings", ["taggable_id"], name: "index_spree_taggings_on_taggable_id", using: :btree
  add_index "spree_taggings", ["taggable_type"], name: "index_spree_taggings_on_taggable_type", using: :btree
  add_index "spree_taggings", ["tagger_id", "tagger_type"], name: "index_spree_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "spree_taggings", ["tagger_id"], name: "index_spree_taggings_on_tagger_id", using: :btree

  create_table "spree_tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "spree_tags", ["name"], name: "index_spree_tags_on_name", unique: true, using: :btree

  create_table "spree_tax_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_default",              default: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_code",    limit: 255
  end

  add_index "spree_tax_categories", ["deleted_at"], name: "index_spree_tax_categories_on_deleted_at", using: :btree
  add_index "spree_tax_categories", ["is_default"], name: "index_spree_tax_categories_on_is_default", using: :btree

  create_table "spree_tax_rates", force: :cascade do |t|
    t.decimal  "amount",                         precision: 8, scale: 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",               limit: 255
    t.boolean  "show_rate_in_label",                                     default: true
    t.datetime "deleted_at"
  end

  add_index "spree_tax_rates", ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at", using: :btree
  add_index "spree_tax_rates", ["included_in_price"], name: "index_spree_tax_rates_on_included_in_price", using: :btree
  add_index "spree_tax_rates", ["show_rate_in_label"], name: "index_spree_tax_rates_on_show_rate_in_label", using: :btree
  add_index "spree_tax_rates", ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id", using: :btree
  add_index "spree_tax_rates", ["zone_id"], name: "index_spree_tax_rates_on_zone_id", using: :btree

  create_table "spree_taxonomies", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",               default: 0
  end

  add_index "spree_taxonomies", ["position"], name: "index_spree_taxonomies_on_position", using: :btree

  create_table "spree_taxons", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "position",                      default: 0
    t.string   "name",              limit: 255,             null: false
    t.string   "permalink",         limit: 255
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title",        limit: 255
    t.string   "meta_description",  limit: 255
    t.string   "meta_keywords",     limit: 255
    t.integer  "depth"
  end

  add_index "spree_taxons", ["lft"], name: "index_spree_taxons_on_lft", using: :btree
  add_index "spree_taxons", ["name"], name: "index_spree_taxons_on_name", using: :btree
  add_index "spree_taxons", ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
  add_index "spree_taxons", ["permalink"], name: "index_taxons_on_permalink", using: :btree
  add_index "spree_taxons", ["position"], name: "index_spree_taxons_on_position", using: :btree
  add_index "spree_taxons", ["rgt"], name: "index_spree_taxons_on_rgt", using: :btree
  add_index "spree_taxons", ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree

  create_table "spree_trackers", force: :cascade do |t|
    t.string   "analytics_id", limit: 255
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_trackers", ["active"], name: "index_spree_trackers_on_active", using: :btree

  create_table "spree_users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email",                  limit: 255
    t.string   "remember_token",         limit: 255
    t.string   "persistence_token",      limit: 255
    t.string   "reset_password_token",   limit: 255
    t.string   "perishable_token",       limit: 255
    t.integer  "sign_in_count",                      default: 0, null: false
    t.integer  "failed_attempts",                    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "login",                  limit: 255
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token",   limit: 255
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spree_api_key",          limit: 48
    t.string   "api_key",                limit: 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "spree_users", ["bill_address_id"], name: "index_spree_users_on_bill_address_id", using: :btree
  add_index "spree_users", ["deleted_at"], name: "index_spree_users_on_deleted_at", using: :btree
  add_index "spree_users", ["email"], name: "email_idx_unique", unique: true, using: :btree
  add_index "spree_users", ["ship_address_id"], name: "index_spree_users_on_ship_address_id", using: :btree
  add_index "spree_users", ["spree_api_key"], name: "index_spree_users_on_spree_api_key", using: :btree

  create_table "spree_variants", force: :cascade do |t|
    t.string   "sku",             limit: 255,                          default: "",    null: false
    t.decimal  "weight",                      precision: 8,  scale: 2, default: 0.0
    t.decimal  "height",                      precision: 8,  scale: 2
    t.decimal  "width",                       precision: 8,  scale: 2
    t.decimal  "depth",                       precision: 8,  scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                            default: false
    t.integer  "product_id"
    t.decimal  "cost_price",                  precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency",   limit: 255
    t.boolean  "track_inventory",                                      default: true
    t.integer  "tax_category_id"
    t.datetime "updated_at",                                                           null: false
    t.integer  "lock_version",                                         default: 0
    t.datetime "discontinue_on"
    t.datetime "created_at",                                                           null: false
  end

  add_index "spree_variants", ["deleted_at"], name: "index_spree_variants_on_deleted_at", using: :btree
  add_index "spree_variants", ["discontinue_on"], name: "index_spree_variants_on_discontinue_on", using: :btree
  add_index "spree_variants", ["is_master"], name: "index_spree_variants_on_is_master", using: :btree
  add_index "spree_variants", ["position"], name: "index_spree_variants_on_position", using: :btree
  add_index "spree_variants", ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
  add_index "spree_variants", ["sku"], name: "index_spree_variants_on_sku", using: :btree
  add_index "spree_variants", ["tax_category_id"], name: "index_spree_variants_on_tax_category_id", using: :btree
  add_index "spree_variants", ["track_inventory"], name: "index_spree_variants_on_track_inventory", using: :btree

  create_table "spree_works", force: :cascade do |t|
    t.integer  "position"
    t.text     "caption"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "spree_zone_members", force: :cascade do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type", limit: 255
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_zone_members", ["zone_id"], name: "index_spree_zone_members_on_zone_id", using: :btree
  add_index "spree_zone_members", ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type", using: :btree

  create_table "spree_zones", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "description",        limit: 255
    t.boolean  "default_tax",                    default: false
    t.integer  "zone_members_count",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

  add_index "spree_zones", ["default_tax"], name: "index_spree_zones_on_default_tax", using: :btree
  add_index "spree_zones", ["kind"], name: "index_spree_zones_on_kind", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
