class Rating
  include Mongoid::Document
  include Mongoid::Timestamps
  include Rateable::Model

  belongs_to :rateable, polymorphic: true
  embeds_many :rating_marks, class_name: 'RatingMark'

  field :rating, type: Float, default: nil
end

class RatingMark
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  embedded_in :current_rate, class_name: 'Rating'

  field :rate, type: Integer
  field :rater, type: String
end