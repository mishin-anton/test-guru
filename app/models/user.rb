class User < ApplicationRecord
  has_one :tests

  def tests_list_by_level (level)
    Test.where(level: level, user_id: self.id)
  end
end
