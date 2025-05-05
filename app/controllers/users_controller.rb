class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Profil mis à jour avec succès."
    else
      render :edit, alert: "Erreur de mise à jour"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :location, :description, :dancing_styles, :level, :morphology, :height, :weight)
  end
end
