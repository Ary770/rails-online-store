class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :inventory, :description
  belongs_to :category
  has_many :comments, serializer: CommentSerializer
end
