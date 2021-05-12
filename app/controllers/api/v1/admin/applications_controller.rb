class Api::V1::Admin::ApplicationsController < ApplicationController
  acts_as_token_authentication_handler_for User

  def index
    @applications = Application.all.includes(:user, :vacancy)
    render json: @applications
  end

  def update
    @application = Application.find(params[:id])

    if @application.update(application_update_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  private

  def application_update_params
    params.require(:application).permit(:status)
  end
end
