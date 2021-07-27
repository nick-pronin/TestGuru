class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authorship, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  def test_by_level(level)
    tests.where(level: level)
  end
end
