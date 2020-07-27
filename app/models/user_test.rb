class UserTest < ApplicationRecord

  SUCCESS_ANSWER_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def time_expired?
    created_at + test.duration * 60 <= Time.zone.now ? true : false
  end

  def comleted?
    current_question.nil?
  end

  def success?
    calculate_results >= SUCCESS_ANSWER_PERCENT
  end

  def calculate_results
    total_questions = self.test.questions.count
    correct_answers = self.correct_questions

    @percent_success = (correct_answers.to_f / total_questions.to_f * 100).round
  end

  def current_question_number
    self.test.questions.ids.index(self.current_question.id)+1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    unless answer_ids.nil?
      correct_answers_count = correct_answers.count
      (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      (correct_answers_count == answer_ids.count)
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0: current_question.id).first
  end

end
