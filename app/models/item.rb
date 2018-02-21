class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items 
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {message: "must be a number"}
  
  def self.available_items
    self.all.select do |item|
      item.inventory != 0
    end
  end
end
