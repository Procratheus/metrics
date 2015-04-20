class UsersController < ApplicationController
  before_action :set_user, only: [:update, :finish_signup]

  def update
    respond_to do |format|
      if @user.update(update_params)
        sign_in(@user == current_user ? @user : current_user, bypass: true)
        format.html { redirect_to edit_user_registation_path, notice: "Your profile was successfully updated."}
        format.json { head :no_content}
      else
        format.html { render action: edit}
        format.json { render json: @user.errors, status: :unproccessable_entry }
      end
    end
  end

  def finish_signup
    if request.patch? && params[:user][:email]
      if @user.update(finish_signup_params)
        sign_in(@user, bypass: true)
        redirect_to edit_user_registration_path, notice: "Your profile was succesfully updated."
      else
        @show_errors = true
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def finish_signup_params
      accessible = [:name, :email]
      params.require(:user).permit(accessible)
    end

    def update_params
      accessible = [:name, :email]
      params.require(:user).permit(accessible)
    end

end