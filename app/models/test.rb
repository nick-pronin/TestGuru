class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  has_many :questions, dependent: :destroy

  scope :beginner, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :professor, -> { where(level: 5..Float::INFINITY) }

  scope :sort_by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title) }
end
