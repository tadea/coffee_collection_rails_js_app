class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :comment

  belongs_to :coffee
end
