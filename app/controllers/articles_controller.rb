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

  def edit
  @article = Article.find(params[:id])
  end#Adds an edit action to the ArticlesController.

  def create
  @article = Article.new(article_params)#Initializes new Article model with it artibutes (article_params).

  if @article.save#Saves the model in the database.
  redirect_to @article#Redirect the user to the show action.
  else# If @article.save fails, we need to continue showing the new form back to the user.
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
#The new method, update, is used when you want to update a record that already exists, and it accepts a hash containing
#the attributes that you want to update. As before, if there was an error updating the article we want to show the form back to the user.
#We reuse the article_params method that we defined earlier for the create action.

def destroy#This is a delete method for destroying resources, and this route is mapped to the 'destroy' action inside app/controllers/articles_controller.rb
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end#Note that we don't need to add a view for this action since we're redirecting to the index action.
#Here we're using link_to in a different way. We pass the named route as the second argument, and then the options as another argument.
#The method: :delete and data: { confirm: 'Are you sure?' } options are used as HTML5 attributes so that when the link is clicked,
#Rails will first show a confirm dialog to the user, and then submit the link with method delete.
#This is done via the JavaScript file jquery_ujs which is automatically included in your application's layout (app/views/layouts/application.html.erb) when you generated the application.
#Without this file, the confirmation dialog box won't appear.

private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
#This method tells Rails exactly which parameters are allowed into our controller actions.
#It is made private to make sure it can't be called outside its intended context.
