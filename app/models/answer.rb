class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answer_limit

  scope :correct, -> { where(correct: true) }

  def validate_answer_limit
    # if question.answers.count > 4
    #   errors.add(:base) << "Limit for answers is 4"
    # end
  end
end
