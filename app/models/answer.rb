class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates_length_of :answer, maximum: 4

  scope :correct, -> { where(correct: true) }
end
