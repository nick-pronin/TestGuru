class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  has_many :questions, dependent: :destroy

  def self.sort_by_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
