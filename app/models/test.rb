class Test < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates :name, presence: true
  validates :description, presence: true
end
