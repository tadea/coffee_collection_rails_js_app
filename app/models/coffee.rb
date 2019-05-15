class Coffee < ApplicationRecord
  belongs_to :grind
  has_many :reviews
  has_many :users, through: :reviews

  has_one_attached :image

  validates :name, :description, :process, :origin, :grind, :image,  presence: true



  scope :coffee_origin, -> { order('origin')}
  scope :reviewed,      -> { joins(:reviews).distinct("reviews.coffee_id") }

end
