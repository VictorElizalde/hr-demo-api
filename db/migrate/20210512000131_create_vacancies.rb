class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :title

      t.timestamps
    end
  end
end
