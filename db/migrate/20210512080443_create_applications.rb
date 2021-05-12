class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :personal_site
      t.string :bio
      t.string :status, default: 'pending'
      t.references :user, foreign_key: true
      t.references :vacancy, foreign_key: true

      t.timestamps
    end
  end
end
