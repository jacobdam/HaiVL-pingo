class ArticlesController < ApplicationController
  before_action :check_user_signed_in, except: [:show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article, notice: 'Đăng bài thành công'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.increase_views_count
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Sửa bài thành công'
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    redirect_to my_articles_path
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
