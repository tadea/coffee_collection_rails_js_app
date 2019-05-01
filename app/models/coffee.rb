class Coffee < ApplicationRecord
  belongs_to :user
  belongs_to :grind
  #has_many :reviews


  
end
