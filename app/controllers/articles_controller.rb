class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article].permit(:content))
    current_user.articles << @article
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end


  def index
    @articles = Article.all
  end

end # of class
