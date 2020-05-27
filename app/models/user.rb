class User < ApplicationRecord
  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :validatable,
        :confirmable

  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :own_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_list_by_level (level)
    self.tests.where(level: level)
  end

  def admin?
    self.type == 'Admin'
  end

end
