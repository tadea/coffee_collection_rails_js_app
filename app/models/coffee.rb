class Coffee < ApplicationRecord
  belongs_to :grind
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :description, :process, :origin, :grind,  presence: true
end
