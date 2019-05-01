class User < ApplicationRecord

  has_many :coffes
  has_many :reviews
  #has_many :coffees, through: :reviews
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: :false}


end
