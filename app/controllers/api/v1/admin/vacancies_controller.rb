class Api::V1::Admin::VacanciesController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_vacancy, only: [:show, :update, :destroy]

  def index
    @vacancies = Vacancy.all.includes(:company)
    render json: @vacancies
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    render json: @vacancy
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      render json: @vacancy
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  def update
    if @vacancy.update(vacancy_params)
      render json: @vacancy
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vacancy.destroy
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description, :min_salary, :max_salary, :published_at, :company_id)
  end

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
