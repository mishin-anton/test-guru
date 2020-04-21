class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions

  validates :title, presence: true,
                    uniqueness: true

  validates :level, uniqueness: true
  validates :level, numericality: { only_integer: true }, allow_nil: true, if: :ruby_test?
  validates :level, numericality: { greater_than: 0 }

  validate :validate_max_level, on: :create

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :dificult, -> { where(level: 5..Float::INFINITY) }

  scope :sorted_tests_by_category_name, -> (name_of_category) { Test.order(title: :asc).joins(:category).where(categories: {title: name_of_category}).pluck(:title) }

  # def self.sorted_tests_list_by_category_name(name_of_category)
  #  Test.order(title: :asc).joins(:category).where(categories: { title: name_of_category }).pluck(:title)
  # end

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end

  def ruby_test?
    title.match(/Ruby/i)
  end
end
