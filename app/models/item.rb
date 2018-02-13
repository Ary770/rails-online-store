class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items 
  
  def self.available_items
    self.all.select do |item|
      item.inventory != 0
    end
  end
end
