class HomesController < ApplicationController
  def latest
    @articles = Article.order('created_at DESC').limit(5)
  end

  def hot
  end
end
