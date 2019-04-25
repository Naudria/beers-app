class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :beer_id, :content, :username, :beer


  def username
    self.object.user.name
  end
end
