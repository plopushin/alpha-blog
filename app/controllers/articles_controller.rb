class ArticlesController < ApplicationController
  #for some methods to call, but have to select them.
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index 
    #grab all articles from database
    @articles = Article.all
  end 
  
  def new
    @article = Article.new
  end 
  
  def create
    #use debugger to find things. 
    @article = Article.new(article_params)
    @article.user = User.first
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
      params.require(:article).permit(:title, :description)
    end 
    
end 