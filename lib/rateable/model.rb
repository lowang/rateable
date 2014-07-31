module Rateable
  module Model
    extend ActiveSupport::Concern

    included do
      before_update :calculate_rating
    end

    def calculate_rating
      self.rating = rating_marks.inject(0.0) do |sum, el|
        sum + el.rate
      end.to_f / rating_marks.size
    end
  end
end