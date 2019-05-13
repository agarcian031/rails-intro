class PagesController < ApplicationController
  def index
    @pages = Page.order(:created_at) #will have a value of 3 pages 
    # render :index
  end

  def show
    @page = Page.find(params[:id])
    # render :show 
  end

  def new
    @page = Page.new 
    # render :new
  end

  def create
    @page = Page.new(page_params) 

    if @page.save 
      redirect_to pages_path 
    else 
      render :new 
    end 
  end 
  
  def edit
    # params = {id: "6"}
    @page = Page.find(params[:id])
    # render :edit
  end 
  
  def update 
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to pages_path
    else render :edit 
    end 
  end 
  
  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path # will take back to index view page 
  end 

  private 
  def page_params 
    params.require(:page).permit(:title, :author, :body)
  end 
  #used to shorten the code and not have repetition and can replace .update and create with the def name 
end
