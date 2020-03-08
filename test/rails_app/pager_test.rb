# frozen_string_literal: true

require_relative "./test_helper"

class RailsApp::PagerTest < Minitest::Test
  def test_current_collection
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal map_title(21..30), pager.current_collection.map(&:title)
  end

  def text_first_collection
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal map_title(1..10), pager.first_collection.map(&:title)
  end

  def text_last_collection
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal map_title(121..128), pager.last_collection.map(&:title)
  end

  def text_prev_collection
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal map_title(11..20), pager.prev_collection.map(&:title)
  end

  def text_next_collection
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal map_title(31..40), pager.next_collection.map(&:title)
  end

  def test_current_offset
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 20, pager.current_offset
  end

  def test_first_offset
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 0, pager.first_offset
  end

  def test_last_offset
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 120, pager.last_offset
  end

  def test_prev_offset
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 10, pager.prev_offset
  end

  def test_next_offset
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 30, pager.next_offset
  end

  def test_collection_count
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 128, pager.collection_count
  end

  def test_first_page
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 1, pager.first_page
  end

  def test_first_page?
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal false, pager.first_page?
  end

  def test_last_page
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 13, pager.last_page
  end

  def test_last_page?
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal false, pager.last_page?
  end

  def test_prev_page
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 2, pager.prev_page
  end

  def test_next_page
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 4, pager.next_page
  end

  def test_near_pages_start
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (1..5), pager.near_pages
    assert_equal false, pager.bottom_gap?
    assert_equal true, pager.upper_gap?
  end

  def test_near_pages_mid
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 6, per: 10)
    assert_equal (4..8), pager.near_pages
    assert_equal true, pager.bottom_gap?
    assert_equal true, pager.upper_gap?
  end

  def test_near_pages_end
    collection = Post.all
    pager = ActionPager::Pager.new(collection, page: 12, per: 10)
    assert_equal (9..13), pager.near_pages
    assert_equal true, pager.bottom_gap?
    assert_equal false, pager.upper_gap?
  end

  def test_near_pages_few_start
    collection = Post.where(id: 1..12)
    pager = ActionPager::Pager.new(collection, page: 1, per: 10)
    assert_equal (1..2), pager.near_pages
    assert_equal false, pager.bottom_gap?
    assert_equal false, pager.upper_gap?
  end

  def test_near_pages_few_end
    collection = Post.where(id: 1..12)
    pager = ActionPager::Pager.new(collection, page: 2, per: 10)
    assert_equal (1..2), pager.near_pages
    assert_equal false, pager.bottom_gap?
    assert_equal false, pager.upper_gap?
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
