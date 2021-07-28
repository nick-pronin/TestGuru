class Answer < ApplicationRecord
  belongs_to :question

  MAX_ANSWERS = 4

  validates :body, presence: true
  validate :validate_answers_quantity, on: :create

  scope :correct_answer?, -> { where(correct: true) }

  def validate_answers_quantity
    if question.answers.count >= MAX_ANSWERS
      errors.add(:answers_quantity, "Should be #{MAX_ANSWERS} answers maximum")
    end
  end
end
