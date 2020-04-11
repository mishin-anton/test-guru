class Test < ApplicationRecord
  belongs_to :category, foreign_key: :categories_id
  has_many :user_tests
  has_many :users, through: :user_tests

  def self.tests_by_category(name_of_category)
   j1 = Test.joins("INNER JOIN categories
                    ON tests.categories_id = categories.id
                    AND categories.title = 'Programming'").pluck(:title)
  end

  # Создайте метод класса в модели Test, который возвращает
  # отсортированный по убыванию массив названий всех Тестов у которых
  # Категория называется определённым образом (название категории передается
  # в метод в качестве аргумента).
end
