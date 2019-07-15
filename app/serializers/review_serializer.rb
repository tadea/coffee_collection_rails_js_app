class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment

  belongs_to :coffee
end
