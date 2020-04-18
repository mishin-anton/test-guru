class User < ApplicationRecord
  has_many :own_tests, class_name: 'Test'

  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_list_by_level (level)
      self.tests.where(level: level)
  end
end
