class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :user
end
