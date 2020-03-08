# frozen_string_literal: true

require_relative "../test_helper.rb"
require "active_record"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
    t.string :title, null: false
  end
end

class Post < ActiveRecord::Base; end

module RailsApp; end

class RailsApp::TestHelper
  def self.insert_post_records(count)
    attributes = 1.upto(count).map { |num| { id: num, title: "title_#{num}" } }
    Post.insert_all(attributes)
  end

  def self.truncate_posts_table
    # NOTE: No TRUNCATE SQL syntax in SQLite
    ActiveRecord::Base.connection.execute "DELETE FROM posts;"
    ActiveRecord::Base.connection.execute "VACUUM;"
  end

  def self.map_title(indexes)
    indexes.map { |num| "title_#{num}" }
  end
end
