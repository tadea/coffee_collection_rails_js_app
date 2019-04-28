class Coffee < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  #belongs_to :origin, optional: true

  scope :french_press, -> {where(grind: "French Press")}
  scope :esspreso, -> {where(grind: "Esspreso")}
  scope :pour_over, -> {where(grind: "Pour Over")}
  scope :turkish_coffee, -> {where(grind: "Turkish Coffee")}
end
