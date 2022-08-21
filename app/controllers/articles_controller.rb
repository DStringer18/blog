class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update archive unarchive destroy ]
  skip_before_action :authenticate_admin!, except: [:archived, :new, :edit, :create, :unarchive, :destroy]


  # GET /articles or /articles.json
  def index
    @articles = Article.all&.reject {|a| a.archived? }
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  def architecture
    @articles = Article.all&.select {|a| a.category == "ARCHITECTURE"}&.reject {|a| a.archived? }
  end

  def food
    @articles = Article.all&.select {|a| a.category == "FOOD"}&.reject {|a| a.archived? }
  end

  def history
    @articles = Article.all&.select {|a| a.category == "HISTORY"}&.reject {|a| a.archived? }
  end

  def landscapes
    @articles = Article.all&.select {|a| a.category == "LANDSCAPES"}&.reject {|a| a.archived? }
  end

  def traditions
    @articles = Article.all&.select {|a| a.category == "TRADITIONS"}&.reject {|a| a.archived? }
  end

  def archived
    @articles = Article.all&.select {|a| a.archived? }
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    @article.archive!
    redirect_to root_path, status: :see_other, notice: "The post was archived."
  end

  def unarchive
    @article.unarchive!
    redirect_to archived_articles_path, status: :see_other, notice: "The post was unarchived."
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :category, :image)
    end
end
