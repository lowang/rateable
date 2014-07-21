class Rate
  include Mongoid::Document
  include Mongoid::Timestamps
  include Rateable::Model

  belongs_to :rateable, polymorphic: true
  embeds_many :ratings, class_name: 'Rating'

  field :rating, type: Float, default: nil
end

class Rating
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  embedded_in :current_rate, class_name: 'Rate'

  field :rate, type: Integer
  field :rater, type: String
end