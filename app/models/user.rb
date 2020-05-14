class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :own_tests, class_name: 'Test', foreign_key: :user_id

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_list_by_level (level)
    self.tests.where(level: level)
  end
end
