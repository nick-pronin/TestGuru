class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable

  attr_reader :password
  attr_writer :password_confirmation
  attr_writer :login

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorship, class_name: "Test", foreign_key: "author_id", dependent: :nullify
  validates :name, :last_name, presence: true
  has_many :gists, dependent: :destroy

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    "#{self.name } #{self.last_name}"
  end
end
