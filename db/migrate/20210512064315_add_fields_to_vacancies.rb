class AddFieldsToVacancies < ActiveRecord::Migration[5.2]
  def change
    add_column :vacancies, :description, :string
    add_column :vacancies, :min_salary, :string
    add_column :vacancies, :max_salary, :string
    add_column :vacancies, :published_at, :datetime
    add_reference :vacancies, :company, foreign_key: true
  end
end
