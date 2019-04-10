class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :beer_id, :content
  belongs_to :beer
  belongs_to :user
end
