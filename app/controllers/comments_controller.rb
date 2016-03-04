class CommentsController < ApplicationController
  before_action :check_user_signed_in

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(params.require(:comment).permit(:content))
    @comment.user = current_user
    @comment.article = @article

    if @comment.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article), alert: 'Bình luận không hợp lệ'
    end
  end
end
