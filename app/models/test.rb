class Test < ApplicationRecord
  def self.tests_by_category(name_of_category)
    cat = Category.find_by(title: name_of_category)
    Test.order(title: :desc).where(categories_id:  cat.id)
  end
end
