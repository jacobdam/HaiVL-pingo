class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 10 }
  validates :content, presence: true, length: { minimum: 50 }
end
