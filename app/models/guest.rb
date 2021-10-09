class Guest < ApplicationRecord
	has_many :reservations, dependent: :destroy
	has_many :phone_numbers, dependent: :destroy

	 validates :email, uniqueness: true
end
