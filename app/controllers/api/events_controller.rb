class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @registered_application = RegistratedApplication.find_by(url: request.env["HTTP_ORIGIN"])
    render json: "Unregistered Application", status: :unprocessable_entity unless @registered_application != nil
    @event = @registered_application.events.build(event_params)
    if @event
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  protected

  def event_params
    params.require(:event).permit(:name)
  end

end