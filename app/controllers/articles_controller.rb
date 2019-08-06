class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
    # editing
  end

  def show
    # editing
    renderer = Redcarpet::Render::HTML.new(prettify: true)
    markdown = Redcarpet::Markdown.new(renderer)
    @content = markdown.render(@article.content)
  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
