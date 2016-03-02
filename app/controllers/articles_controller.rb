class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :content))
    @article.user = current_user

    if @article.save
      redirect_to @article, notice: 'Đăng bài thành công'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end
end
