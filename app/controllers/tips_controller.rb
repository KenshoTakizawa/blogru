class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit]
  before_action :only_admin, except: [:index, :show]

  def index
    @tips = Tip.all
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    if @tip.save
      redirect_to tips_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    tip = Tip.find(params[:id])
    if tip.update(tip_params)
      redirect_to tip_path(tip.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    tip = Tip.find(params[:id])
    tip.destroy
    redirect_to tips_path
  end

  private

  def only_admin
    unless current_admin
      redirect_to root_path
    end
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:title, :image, :content).merge(admin_id: current_admin.id)
  end
end
