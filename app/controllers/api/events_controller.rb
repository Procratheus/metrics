class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    @registered_application = RegistratedApplication.find_by(url: request.env["HTTP_ORIGIN"])
    if @registered_application == nil
      render json: "Unregistered Application", status: :unprocessable_entity 
    else
      @event = @registered_application.events.build(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

  protected

  def event_params
    params.require(:event).permit(:name)
  end

end