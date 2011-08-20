require 'test_helper'

class LunchTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Test date formatting methods" do
    lunch = Lunch.new
    lunch.formatted_date = '8/24/2011'
    assert(lunch.date == DateTime.new(2011,8,24))


  end
end
