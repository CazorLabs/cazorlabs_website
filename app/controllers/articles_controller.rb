class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show]
  allow_unauthenticated_access
  # GET /articles or /articles.json
  def index
    if params[:query].present?
      sql_query = "title LIKE :query OR content LIKE :query"
      @records =Article.where(sql_query, query: "%#{params[:query]}%")
      @pagy, @articles = pagy(@records, limit: 10)
    else
      @pagy, @articles = pagy(Article.published, limit: 10)
    end
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find_by(slug: params.expect(:slug))
  end

  def article_params
    params.expect(article: [ :title, :content ])
  end
end
