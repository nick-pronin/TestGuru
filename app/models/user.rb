class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorship, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
