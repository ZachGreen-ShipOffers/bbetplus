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

ActiveRecord::Schema.define(version: 20140905173414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "uuid-ossp"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "clients_assemblies", id: false, force: :cascade do |t|
    t.integer  "id",                 default: "nextval('clients_assemblies_id_seq'::regclass)", null: false
    t.integer  "clients_sku_id"
    t.integer  "clients_product_id"
    t.integer  "quantity",           default: 1,                                                null: false
    t.integer  "quantity_type",      default: 0,                                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_clients", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "primary_contact", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "address1",        limit: 255
    t.string   "address2",        limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "postal_code",     limit: 255
    t.string   "country",         limit: 255
    t.string   "phone",           limit: 255
    t.string   "email",           limit: 255
    t.uuid     "uuid",                        default: "uuid_generate_v4()"
  end

  create_table "clients_contacts", id: false, force: :cascade do |t|
    t.integer  "id",                            default: "nextval('clients_contacts_id_seq'::regclass)", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "address1",          limit: 255
    t.string   "address2",          limit: 255
    t.string   "city",              limit: 255
    t.string   "state",             limit: 255
    t.string   "postal_code",       limit: 255
    t.string   "country",           limit: 255
    t.string   "phone",             limit: 255
    t.string   "email",             limit: 255
    t.integer  "clients_client_id"
  end

  add_index "clients_contacts", ["clients_client_id"], name: "index_clients_contacts_on_clients_client_id", using: :btree

  create_table "clients_order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "row_number"
    t.integer  "clients_sku_id"
    t.integer  "clients_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "uuid",             default: "uuid_generate_v4()"
  end

  add_index "clients_order_items", ["clients_order_id"], name: "index_clients_order_items_on_clients_order_id", using: :btree
  add_index "clients_order_items", ["clients_sku_id"], name: "index_clients_order_items_on_clients_sku_id", using: :btree

  create_table "clients_orders", force: :cascade do |t|
    t.string   "order_number",                   limit: 255
    t.integer  "clients_store_id"
    t.string   "requested_shipping_service",     limit: 255
    t.string   "status",                         limit: 255
    t.string   "tracking_number",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                     limit: 255
    t.string   "last_name",                      limit: 255
    t.string   "address1",                       limit: 255
    t.string   "address2",                       limit: 255
    t.string   "city",                           limit: 255
    t.string   "state",                          limit: 255
    t.string   "postal_code",                    limit: 255
    t.string   "country",                        limit: 255
    t.string   "phone",                          limit: 255
    t.string   "email",                          limit: 255
    t.date     "order_date"
    t.date     "ship_date"
    t.integer  "clients_orders_import_row_id"
    t.integer  "ship_offers_external_record_id"
    t.string   "merge_key",                      limit: 255
    t.uuid     "uuid",                                       default: "uuid_generate_v4()"
    t.string   "company",                        limit: 255
    t.string   "ship_name",                      limit: 255
  end

  add_index "clients_orders", ["clients_orders_import_row_id"], name: "index_clients_orders_on_clients_orders_import_row_id", using: :btree
  add_index "clients_orders", ["clients_store_id"], name: "index_clients_orders_on_clients_store_id", using: :btree
  add_index "clients_orders", ["ship_offers_external_record_id"], name: "index_clients_orders_on_ship_offers_external_record_id", using: :btree

  create_table "clients_orders_import_rows", force: :cascade do |t|
    t.hstore   "row_hash"
    t.string   "status",                     limit: 255
    t.integer  "clients_orders_import_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                     limit: 255
    t.string   "reasons",                                array: true
    t.string   "order_number",               limit: 255
    t.string   "requested_shipping_service", limit: 255
    t.string   "first_name",                 limit: 255
    t.string   "last_name",                  limit: 255
    t.string   "address1",                   limit: 255
    t.string   "address2",                   limit: 255
    t.string   "city",                       limit: 255
    t.string   "state",                      limit: 255
    t.string   "postal_code",                limit: 255
    t.string   "country",                    limit: 255
    t.string   "phone",                      limit: 255
    t.string   "email",                      limit: 255
    t.string   "order_date",                 limit: 255
    t.string   "ship_date",                  limit: 255
    t.string   "merge_key",                  limit: 255
    t.string   "company",                    limit: 255
    t.string   "ship_name",                  limit: 255
  end

  create_table "clients_orders_imports", force: :cascade do |t|
    t.integer  "clients_user_id"
    t.integer  "clients_store_id"
    t.string   "status",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "clients_orders_shipments", id: false, force: :cascade do |t|
    t.integer  "id",                  default: "nextval('clients_orders_shipments_id_seq'::regclass)", null: false
    t.integer  "clients_order_id"
    t.integer  "clients_shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients_orders_shipments", ["clients_order_id"], name: "index_clients_orders_shipments_on_clients_order_id", using: :btree
  add_index "clients_orders_shipments", ["clients_shipment_id"], name: "index_clients_orders_shipments_on_clients_shipment_id", using: :btree

  create_table "clients_products", force: :cascade do |t|
    t.decimal  "price"
    t.string   "name",                   limit: 255
    t.string   "description",            limit: 255
    t.integer  "clients_client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ship_offers_product_id"
    t.decimal  "client_weight"
    t.string   "sku",                    limit: 255
  end

  add_index "clients_products", ["clients_client_id"], name: "index_clients_products_on_clients_client_id", using: :btree
  add_index "clients_products", ["ship_offers_product_id"], name: "index_clients_products_on_ship_offers_product_id", using: :btree

  create_table "clients_shipment_items", force: :cascade do |t|
    t.integer  "clients_shipment_id"
    t.integer  "clients_product_id"
    t.integer  "quantity"
    t.decimal  "weight"
    t.uuid     "uuid",                            default: "uuid_generate_v4()"
    t.string   "clients_sku",         limit: 255
    t.string   "ship_offers_sku",     limit: 255
    t.string   "description",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients_shipment_items", ["clients_product_id"], name: "index_clients_shipment_items_on_clients_product_id", using: :btree
  add_index "clients_shipment_items", ["clients_shipment_id"], name: "index_clients_shipment_items_on_clients_shipment_id", using: :btree

  create_table "clients_shipment_labels", force: :cascade do |t|
    t.string   "external_service_key", limit: 255
    t.string   "status",               limit: 255
    t.integer  "clients_shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_number",      limit: 255
  end

  create_table "clients_shipments", force: :cascade do |t|
    t.string   "first_name",            limit: 255
    t.string   "last_name",             limit: 255
    t.string   "address1",              limit: 255
    t.string   "address2",              limit: 255
    t.string   "city",                  limit: 255
    t.string   "state",                 limit: 255
    t.string   "postal_code",           limit: 255
    t.string   "country",               limit: 255
    t.string   "phone",                 limit: 255
    t.string   "email",                 limit: 255
    t.string   "external_service_key",  limit: 255
    t.integer  "external_service_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clients_order_id"
    t.string   "status",                limit: 255
    t.string   "tracking_number",       limit: 255
    t.boolean  "voided"
    t.uuid     "uuid",                              default: "uuid_generate_v4()"
    t.string   "order_number",          limit: 255
    t.string   "company_name",          limit: 255
    t.string   "ship_name",             limit: 255
  end

  add_index "clients_shipments", ["clients_order_id"], name: "index_clients_shipments_on_clients_order_id", using: :btree

  create_table "clients_skus", force: :cascade do |t|
    t.string   "description",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clients_store_id"
    t.string   "sku",              limit: 255
    t.boolean  "active"
  end

  add_index "clients_skus", ["clients_store_id"], name: "index_clients_skus_on_clients_store_id", using: :btree

  create_table "clients_stores", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "marketplace",       limit: 255
    t.boolean  "active"
    t.integer  "clients_client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "address1",          limit: 255
    t.string   "address2",          limit: 255
    t.string   "city",              limit: 255
    t.string   "state",             limit: 255
    t.string   "postal_code",       limit: 255
    t.string   "country",           limit: 255
    t.string   "phone",             limit: 255
    t.string   "email",             limit: 255
    t.string   "external_id",       limit: 255
    t.uuid     "uuid",                          default: "uuid_generate_v4()"
  end

  add_index "clients_stores", ["clients_client_id"], name: "index_clients_stores_on_clients_client_id", using: :btree

  create_table "clients_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clients_contact_id"
  end

  add_index "clients_users", ["clients_contact_id"], name: "index_clients_users_on_clients_contact_id", using: :btree
  add_index "clients_users", ["email"], name: "index_clients_users_on_email", unique: true, using: :btree
  add_index "clients_users", ["reset_password_token"], name: "index_clients_users_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ship_offers_external_records", force: :cascade do |t|
    t.string   "external_service_key",  limit: 255
    t.string   "external_service_type", limit: 255
    t.hstore   "request_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                limit: 255
  end

  create_table "ship_offers_products", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sku",        limit: 255
    t.string   "name",       limit: 255
    t.decimal  "weight"
  end

  create_table "xml_stores", force: :cascade do |t|
    t.text     "xml"
    t.string   "url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "params"
  end

end
