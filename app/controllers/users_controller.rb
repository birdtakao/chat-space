class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if current_user.update(profile_params)
      redirect_to :root
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:user).permit(:name, :email)
  end
end
