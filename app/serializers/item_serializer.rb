class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :inventory, :description
  belongs_to :category
end
