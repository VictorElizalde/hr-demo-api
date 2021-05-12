class Api::V1::ApplicationsController < ApplicationController
  acts_as_token_authentication_handler_for User

  def create
    @application = Application.new(application_params)

    if @application.save
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.require(:application).permit(:personal_site, :cv, :bio, :user_id, :vacancy_id)
  end
end
