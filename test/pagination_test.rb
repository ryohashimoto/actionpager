require_relative "./test_helper.rb"
require "ostruct"

class PaginationTest < Minitest::Test
  class TestController
    include ActionPager::Pagination
  end

  def test_pager_for
    controller = TestController.new
    collection = (1..128).to_a
    pager = controller.pager_for(collection)
    assert_equal (1..5).to_a, pager.current_collection
  end

  def test_pager_for_with_options
    controller = TestController.new
    collection = (1..128).to_a
    pager = controller.pager_for(collection, page: 3, per: 10)
    assert_equal (21..30).to_a, pager.current_collection
  end
end
