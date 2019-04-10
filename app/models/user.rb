class User < ApplicationRecord
  has_many :beers, :class_name => 'Beer', :foreign_key => 'user_id', dependent: :destroy
  has_many :comments

  has_secure_password
  # A method that uses Bcrypt to hash passwords
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  def self.find_or_create_by_omniauth(auth_hash)
    where(:email => auth_hash["info"]["email"]).first_or_create do  |user|
      user.name = auth_hash["info"]["name"]
      user.password = SecureRandom.hex
    end
  end



end
