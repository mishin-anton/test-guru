class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions

  def self.sorted_tests_list_by_category_name(name_of_category)
   Test.order(title: :asc).joins(:category).where(categories: { title: name_of_category }).pluck(:title)

  end
end
