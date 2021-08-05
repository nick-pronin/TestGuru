class TestPassage < ApplicationRecord

  SUCCESS_VALUE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.score += 1 if correct_answer?(answer_ids)
    save!
  end

  def test_result
    (self.score / test.total_questions) * 100
  end

  def successful?
    test_result >= SUCCESS_VALUE if completed?
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question).count
  end

  private

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
