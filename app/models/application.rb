class Application < ApplicationRecord
  belongs_to :user
  belongs_to :vacancy

  has_one_attached :cv
end
