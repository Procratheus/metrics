class UsersController < ApplicationController
  before_action :set_user, only: [ :update, :finish_signup ]

  def update
    if @user.update(user_params)
      sign_in(@user == current_user ? @user : current_user, bypass: true)
      flash[:info] = "You have updated your user profile succesfully"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Your credentials were not updated successfully. Please try again!"
      render @user.errors
    end
  end

  def finish_signup
    if request.patch? && params[:user]
      if @user.update(user_params)
        sign_in(@user, bypass: true)
        redirect_to edit_user_registration_path
        flash[:info] = "You have updated your user profile succesfully"
      else
        @show_errors = true
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email ]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

end