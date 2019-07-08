class CoffeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :process, :origin, :grind_id

  has_many :reviews

end
