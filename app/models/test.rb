class Test < ApplicationRecord
  has_many :usertests
  has_many :users, through: :usertests

  def self.tests_by_category(name_of_category)
    cat = Category.find_by(title: name_of_category)
    Test.order(title: :desc).where(categories_id:  cat.id)
  end
end
