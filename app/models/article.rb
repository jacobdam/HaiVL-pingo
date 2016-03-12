class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, presence: true, length: { minimum: 10 }
  validates :content, presence: true, length: { minimum: 50 }

  def votes_count(value)
    votes.where(value: value).count
  end
end
