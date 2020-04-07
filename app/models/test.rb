class Test < ApplicationRecord
  def self.tests_by_category(name_of_category)
    # Создайте метод класса в модели Test,
    # который возвращает отсортированный по убыванию массив названий всех Тестов
    # у которых Категория называется определённым образом
    # (название категории передается в метод в качестве аргумента).
    cat = Category.find_by(title: name_of_category)
    Test.order(title: :desc).where(categories_id:  cat.id)
  end
end
