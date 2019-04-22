class Beer < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id', optional: true
  has_many :comments, dependent: :destroy
  validates_presence_of :name, :brewery, :abv, :user_id, :review
  validates_uniqueness_of :name

  def next
    beer = Beer.where("id > ?", id).first
    if beer
      beer
    else
      Beer.first

    end
  end

end
