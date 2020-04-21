class Question < ApplicationRecord
  belongs_to :test
  has_many :answer

  validates :body, presence: true
  validates_length_of :answer, maximum: 4
end
