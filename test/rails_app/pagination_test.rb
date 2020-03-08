# frozen_string_literal: true

require_relative "./test_helper"

class PaginationTest < Minitest::Test
  class TestController
    include ActionPager::Pagination
  end

  def test_pager_for
    controller = TestController.new
    collection = Post.all
    pager = controller.pager_for(collection)
    assert_equal map_title(1..5), pager.current_collection.map(&:title)
  end

  def test_pager_for_with_options
    controller = TestController.new
    collection = Post.all
    pager = controller.pager_for(collection, page: 3, per: 10)
    assert_equal map_title(21..30), pager.current_collection.map(&:title)
  end

  def setup
    RailsApp::TestHelper.insert_post_records(128)
  end

  def teardown
    RailsApp::TestHelper.truncate_posts_table
  end

  def map_title(indexes)
    RailsApp::TestHelper.map_title(indexes)
  end
end
