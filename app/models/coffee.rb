class Coffee < ApplicationRecord
  belongs_to :grind
  has_many :reviews
  has_many :users, through: :reviews

  has_one_attached :image

  validates :name, :description, :process, :origin,  presence: true
  #validates :image, presence: true, on: :create
  #validate :image_type


  scope :coffee_origin, -> { order('origin')}
  scope :reviewed,      -> { joins(:reviews).distinct("reviews.coffee_id") }

  private

  def image_type
    if image.attached? == false
      errors.add(:image, "must have an attachement.")
    end
    end
  end
