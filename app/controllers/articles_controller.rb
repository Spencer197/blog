class ArticlesController < ApplicationController
  def show#Adds show action
    @article = Article.find(params[:id])# Finds the article we're interested in, passing in params[:id] to get the :id parameter from the request
  end#We also use an instance variable (prefixed with @) to hold a reference to the article object. We do this because Rails will pass all instance variables to the view.

  def new
  end

  def create
  @article = Article.new(article_params)#Initializes new Article model with it artibutes (article_params).

  @article.save#Saves the model in the database.
  redirect_to @article#Redirect the user to the show action.
end

private#This method tells Rails exactly which parameters are allowed into our controller actions.  It is made private to make sure it can't be called outside its intended context
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
