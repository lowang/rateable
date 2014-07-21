module Rateable
  module Model
    extend ActiveSupport::Concern

    included do
      before_update :calculate_rating
    end

    def calculate_rating
      self.rating = ratings.inject(0.0) do |sum, el|
        sum + el.rate
      end.to_f / ratings.size
    end
  end
end