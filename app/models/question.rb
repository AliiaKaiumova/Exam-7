class Question < ActiveRecord::Base
  belongs_to :test

  validates :content, presence: true
end
