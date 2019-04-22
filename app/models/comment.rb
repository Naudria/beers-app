class Comment < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  validates :content, presence: true

end
