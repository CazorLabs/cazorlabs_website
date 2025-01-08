class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :convert_markdown, only: %i[ update ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  def show
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.slug = @article.title.parameterize
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path, notice: "Article was successfully created." }
      else
        format.html { redirect_to admin_articles_path, notice: "Article was not created." }

      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.json { render :show, status: :ok, location: @article }
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /articles/1 or /articles/1.json

  def destroy
    @article.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.expect(article: [ :title, :content, :publish_date ])
  end
end
