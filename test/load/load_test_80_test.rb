require "test_helper"
require "active_support/test_case"

class LoadTest80 < ActiveSupport::TestCase
  test "dummy test 80" do
    sleep(1)
    assert_equal 2, 1 + 1
  end
end