require "bundler/setup"
require 'sqlite3'
require "activerecord_lookup_or_initialize"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define(version: 1) do
  create_table "users", force: true do |t|
    t.string   "email"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "message"
  end

end

class User < ActiveRecord::Base
  has_many :comments, autosave: true, dependent: :destroy, inverse_of: :user
end

class Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
end
