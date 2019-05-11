class Coffee < ApplicationRecord
  belongs_to :grind
  has_many :reviews
  has_many :users, through: :reviews

  has_one_attached :image

  validates :name, :description, :process, :origin, :grind, :image,  presence: true
end
