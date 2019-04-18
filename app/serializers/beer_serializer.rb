class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :brewery, :abv, :review, :user_id, :comments
  belongs_to :user
end
