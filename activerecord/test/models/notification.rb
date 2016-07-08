class Notification < ActiveRecord::Base
  validates_presence_of :message

  def dhh
    false
  end
end
