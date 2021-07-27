class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.sort_by_category(category)
    joins(:category).where(categories: { title: cat }).order(title: :desc).pluck(:title)
  end
end
