require_relative "./test_helper.rb"
require "ostruct"

class ActionPagerTest < Minitest::Test
  def test_scoped
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal (21..30).to_a, pager.scoped
  end

  def test_offset
    collection = (1..128).to_a
    pager = ActionPager::Pager.new(collection, page: 3, per: 10)
    assert_equal 20, pager.offset
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
end
