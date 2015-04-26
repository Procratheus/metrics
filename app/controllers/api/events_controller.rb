class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @event = RegistratedApplication.find_by(url: request.env["HTTP_ORIGIN"])
    render json: "Unregistered Application", status: :unprocessable_entity unless @event
    if registered_application.create(event_params)
      render json: @event, status: :created
    else
      reader json: @event.errors, status: :unprocessable_entity
    end
  end

  protected

  def event_params
    params.require(:event).permit(:name)
  end

end