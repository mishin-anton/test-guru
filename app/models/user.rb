class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_list_by_level (level)

  end
end
