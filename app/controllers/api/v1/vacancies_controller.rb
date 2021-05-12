class Api::V1::VacanciesController < ApplicationController
  def list_vacancies
    @vacancies = Vacancy.all.includes(:company)
  end

  def see_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
