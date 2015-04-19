class UserController
  before_action :set_user

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, bypass: true)
        format.html { redirect_to @user, notice: "Your profile was successfully updated."}
        format.json { head :no_content}
      else
        format.html { render action: edit}
        forma.json { render json: @user.errors, status: :unproccessable_entry }
      end
    end
  end

  def finish_signup
    if request.patch? && params[:user][:email]
      if @user.update(user_params)
        sign_in(@user, bypass: true)
        redirect_to @user, notice: "Your profile was succesfully updated."
      else
        redirect_to @user, notice: "Your profile was not succesfully updated. Please try again."
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [:name, :email]
      accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end

end