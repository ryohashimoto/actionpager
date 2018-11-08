require_relative "./test_helper.rb"
require "ostruct"
require "pry"

class ActionPagerTest < Minitest::Test
  def test_current_collection
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (21..30).to_a, pager.current_collection
  end

  def text_first_collection
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (1..10).to_a, pager.first_collection
  end

  def text_last_collection
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (121..128).to_a, pager.last_collection
  end

  def text_prev_collection
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (11..20).to_a, pager.prev_collection
  end

  def text_next_collection
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (31..40).to_a, pager.next_collection
  end

  def test_current_offset
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 20, pager.current_offset
  end

  def test_first_offset
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 0, pager.first_offset
  end

  def test_last_offset
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 120, pager.last_offset
  end

  def test_prev_offset
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 10, pager.prev_offset
  end

  def test_next_offset
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 30, pager.next_offset
  end

  def test_collection_count
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 128, pager.collection_count
  end

  def test_first_page
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 1, pager.first_page
  end

  def test_first_page?
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal false, pager.first_page?
  end

  def test_last_page
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 13, pager.last_page
  end

  def test_last_page?
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal false, pager.last_page?
  end

  def test_prev_page
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 2, pager.prev_page
  end

  def test_next_page
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 4, pager.next_page
  end

  def test_near_pages_start
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (1..5), pager.near_pages
    assert_equal false, pager.bottom_gap?
    assert_equal true, pager.upper_gap?
  end

  def test_near_pages_mid
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 6, per: 10)
    assert_equal (4..8), pager.near_pages
    assert_equal true, pager.bottom_gap?
    assert_equal true, pager.upper_gap?
  end

  def test_near_pages_end
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 12, per: 10)
    assert_equal (9..13), pager.near_pages
    assert_equal true, pager.bottom_gap?
    assert_equal false, pager.upper_gap?
  end

  def test_near_pages_few_start
    collection = (1..12).to_a
    pager = ActionPager::Pager.new(collection, page: 1, per: 10)
    assert_equal (1..2), pager.near_pages
    assert_equal false, pager.bottom_gap?
    assert_equal false, pager.upper_gap?
  end

  def test_near_pages_few_end
    collection = (1..12).to_a
    pager = ActionPager::Pager.new(collection, page: 2, per: 10)
    assert_equal (1..2), pager.near_pages
    assert_equal false, pager.bottom_gap?
    assert_equal false, pager.upper_gap?
  end
end
