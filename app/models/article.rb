class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :votes

  validates :title, presence: true, length: { minimum: 10 }
  validates :content, presence: true, length: { minimum: 50 }

  def votes_count(value)
    votes.where(value: value).count
  end

  def increase_views_count
    Article.increment_counter(:views_count, self.id)
  end

  def self.hot_articles
    # SELECT articles.*, IFNULL(SUM(votes.value), 0)
    # FROM articles
    # LEFT JOIN votes
    #   ON votes.article_id = articles.id
    # GROUP BY articles.id
    # ORDER BY SUM(votes.value) DESC
    # LIMIT 5;
    joins('LEFT JOIN votes ON votes.article_id = articles.id')
      .group('articles.id')
      .order('SUM(votes.value) DESC')
      .limit(5)
  end
end
