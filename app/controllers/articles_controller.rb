class ArticlesController < ApplicationController

  skip_before_action :authenticate_admin!, only: [:index, :blog_index, :copy_index, :show]

  def index
  end

  def blog_index
    @articles = Article.where(kind: "blog")&.reject {|a| a.archived? }
  end

  def copy_index
    @articles = Article.where(kind: "copy")&.reject {|a| a.archived? }
  end

  def archived
    @articles = Article.all.select {|a| a.archived? }
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
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def archive
    @article = Article.find(params[:id])
    @article.archive!
    redirect_to root_path, status: :see_other, notice: "The post was archived."
  end

  def unarchive
    @article = Article.find(params[:id])
    @article.unarchive!
    redirect_to archived_path, status: :see_other, notice: "The post was unarchived."
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def article_params
      params.require(:article).permit(:kind, :title, :body, :photo)
    end

end
