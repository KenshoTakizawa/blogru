class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit]
  before_action :only_admin, except: [:index, :show]

  def index
    @seo_tutorials = Tutorial.where(tuto_category_id: 2)
    @copy_tutorials = Tutorial.where(tuto_category_id: 3)
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      redirect_to tutorials_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      redirect_to tutorial_path(tutorial.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    tutorial = Tutorial.find(params[:id])
    tutorial.destroy
    redirect_to tutorials_path
  end

  private

  def only_admin
    unless current_admin
      redirect_to root_path
    end
  end

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :image, :content, :tuto_category_id).merge(admin_id: current_admin.id)
  end
end
