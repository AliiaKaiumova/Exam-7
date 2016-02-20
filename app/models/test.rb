class Test < ActiveRecord::Base
  has_many :questions

  validates :name, presence: true
  validates :description, presence: true
end
