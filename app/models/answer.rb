class Answer < ActiveRecord::Base
  belongs_to :question
  belong_to :test

  validates :content, presence: true
  validates :status, presence: true
end
