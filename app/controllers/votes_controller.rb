class VotesController < ApplicationController
  before_action :check_user_signed_in

  def update
    article = Article.find(params[:article_id])
    value = params.require(:vote).require(:value)

    current_user.vote!(article, value)

    redirect_to article
  end

  def destroy
    article = Article.find(params[:article_id])
    current_user.unvote!(article)

    redirect_to article
  end
end
