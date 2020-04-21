class User < ApplicationRecord
  has_many :own_tests, class_name: 'Test'

  has_many :user_tests
  has_many :tests, through: :user_tests

  scope :list_by_level, ->(level) { Test.where("level = ?", level) }
end
