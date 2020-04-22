class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions

  validates :title, :level presence: true, uniqueness: true
  validates :level, numericality: { greater_than: 0, only_integer: true }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :dificult, -> { where(level: 5..Float::INFINITY) }

  def self.sorted_tests_list_by_category_name(name_of_category)
   Test.order(title: :asc).joins(:category).where(categories: { title: name_of_category }).pluck(:title)
  end
end
