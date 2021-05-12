class Api::V1::Admin::CompaniesController < ApplicationController
  before_action :set_company, only: [:update, :destroy]

  def index
    @companies = Company.all
    render json: @companies
  end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
  end

  private

  def company_params
    params.require(:company).permit(:name, :contact_name, :contact_last_name, :contact_phone, :contact_email, :website)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
