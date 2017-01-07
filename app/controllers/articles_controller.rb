class ArticlesController < ApplicationController
  def index#Add the corresponding index action for the route inside the ArticlesController.
    @articles = Article.all
  end

  def show#Adds show action
    @article = Article.find(params[:id])# Finds the article we're interested in, passing in params[:id] to get the :id parameter from the request
  end#We also use an instance variable (prefixed with @) to hold a reference to the article object. We do this because Rails will pass all instance variables to the view.

  def new
    @article = Article.new
  end

  #The reason why we added @article = Article.new in the ArticlesController is that otherwise
  #@article would be nil in our view, and calling @article.errors.any? would throw an error.

  def create
  @article = Article.new(article_params)#Initializes new Article model with it artibutes (article_params).

  if @article.save#Saves the model in the database.
  redirect_to @article#Redirect the user to the show action.
  else# If @article.save fails, we need to continue showing the new form back to the user.
    render 'new'
  end
end

private#This method tells Rails exactly which parameters are allowed into our controller actions.  It is made private to make sure it can't be called outside its intended context
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
