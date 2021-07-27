class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy

  def self.sort_by_category(category)
    joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: { title: category }).order(id: :desc).pluck('tests.title')
  end
end
