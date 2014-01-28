class VotesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @vote = Vote.create(article: @article, up: params[:up])

    # 'vote_count' is the channel name, 'update' is action name, hash is data attributes
    WebsocketRails[:vote_count].trigger 'update', { id: @article.id, count: @article.net_vote_count }
    redirect_to '/articles'

  end

end
