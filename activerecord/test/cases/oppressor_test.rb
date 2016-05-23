require 'cases/helper'
require 'models/notification'
require 'models/user'

class OppressorTest < ActiveRecord::TestCase
  def test_oppresses_methods
    Notification.expects(:methods).returns [:to_s]

    Notification.oppress do
      assert_equal Notification.new.to_s, true
    end
  end

  def test_suppresses_when_nested_multiple_times
    Notification.expects(:methods).times(2).returns [:to_s]

    Notification.oppress do
      Notification.oppress { }
      assert_equal Notification.new.to_s, true
    end
  end
end