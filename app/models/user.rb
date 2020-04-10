class User < ApplicationRecord
  has_many :usertests
  has_many :tests, through: :usertests

  def tests_list_by_level (level)
    Test.where(level: level, user_id: self.id)
  end
end
