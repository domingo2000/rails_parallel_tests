require "test_helper"
require "active_support/test_case"

class LoadTest2 < ActiveSupport::TestCase
  test "dummy test 2" do
    sleep(1)
    assert_equal 2, 1 + 1
  end
end
