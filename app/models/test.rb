class Test < ApplicationRecord
  belongs_to :category, foreign_key: :categories_id
  has_many :user_tests
  has_many :users, through: :user_tests

  def self.sorted_tests_list_by_category_name(name_of_category)
   Test.order(title: :asc).eager_load(:category).where(categories: { title: name_of_category }).pluck(:title)

  end
end
