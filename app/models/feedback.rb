class Feedback < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :name, :email, :message, :id
  validates :name, :email, :message, presence: true
end
