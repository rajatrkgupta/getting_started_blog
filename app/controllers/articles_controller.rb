class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def like_toggle
    @article = Article.find(params[:id])

    if @article.is_liked_by_user?(current_user.id)
      @article.likes.find_by_user_id(current_user.id).delete
      message = I18n.t("articles.like_toggle.dislike")
    else
      @article.likes.create(user_id: current_user.id)
      message = I18n.t("articles.like_toggle.like")
    end


    redirect_to article_path(@article), notice: message
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :image)
    end
end
