class CoffeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :process

  has_many :reviews
end
