require 'digest/sha1'

class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorship, class_name: "Test", foreign_key: "author_id", dependent: :nullify
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
