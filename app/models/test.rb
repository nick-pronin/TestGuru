class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level, message: "A test with the same name and difficulty level already exists" }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :beginner, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :professor, -> { where(level: 5..Float::INFINITY) }

  scope :sort_by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc) }

  def self.tests_by_category(category)
    sort_by_category.pluck(:title)
  end
end
