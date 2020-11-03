class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save!
      redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update(profile_params)
      redirect_to profile_path(@profile.id)
    else
      render :edit
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    profile.destroy
    redirect_to root_path
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:nickname, :learning_history, :purpose, :birth_date, :image).merge(user_id: current_user.id)
  end
end
