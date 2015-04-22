class RegistratedApplicationsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  def index
    @apps = RegistratedApplication.all
  end

  def show
    
  end

  def new
    @app = RegistratedApplication.new
  end

  def create
    @app = current_user.registrated_applications.build(app_params)
    respond_to do |format|
      if @app.save
        format.html {redirect_to @app}
        flash[:notice] = "Your #{@app.name} has been successfully registered"
      else
        format.html {render action: "new"}
        flash[:alert] = "Your app was not successfully registered. Please try again."
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html {redirect_to @app}
        flash[:notice] = "Your app was successfully updated"
      else
        format.html {render action: "edit"}
        flash[:alert] = "Your app was not successfully updated. Please try again."
      end
    end
  end

  def destroy
    respond_to do |format|
      if @app.destroy
        format.html {redirect_to @apps}
        flash[:notice] = "Your app was succesfully deleted."
      else
        format.html {render action: "show"}
        flash[:alert] = "Your app was not successfully deleted. Please try again."
      end
    end
  end

  protected

  def set_app
    @app = RegistratedApplication.find(params[:id])
  end

  def app_params
    params.require(:registrated_application).permit(:name, :url)
  end

end
