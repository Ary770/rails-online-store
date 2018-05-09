class Address < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
