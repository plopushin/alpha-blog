class ArticlesController < ApplicationController
  #for some methods to call, but have to select them.
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  #require_user comes from application controller
  #uses except here as there are fewer that don't require it
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index 
    #grab all articles from database
    #paginte gem -> grabs number of items on page
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end 
  
  def new
    @article = Article.new
  end 
  
  def create
    #use debugger to find things. 
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      #do something
      flash[:success] = "Aritlce was created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end 
  end 
  
  def show 
  end 
  
  def destroy
    @article.destroy
    flash[:success] = "Article was deleted"
    redirect_to articles_path
  end 
  
  def edit
    #find the id of article
  end 
  
  def update
    if @article.update(article_params)
      flash[:danger] = "Article was updated"
      redirect_to article_path(@article)
    else 
      render 'edit'
    end 
     
  end 
  
  private 
    def set_article
      @article = Article.find(params[:id])
    end 
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end 
    
end 
  #ensure it is the same user...eg. different user can't edit if going to path
  def require_same_user
    #checks if current user is not the article creator and checks if user
    #is not an admin.
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete own articles"
      redirect_to root_path
    end 
  end 