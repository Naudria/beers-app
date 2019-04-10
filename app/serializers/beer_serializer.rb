class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :brewery, :abv, :review, :user_id
  belongs_to :user
end
