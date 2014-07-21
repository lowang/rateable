module Rateable
  extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_rateable(options = {})
      options = { class_name: 'Rate' }.merge options
      cattr_accessor :ratable_class
      self.ratable_class = options[:class_name].constantize
      has_one :rating, class_name: options[:class_name], as: :rateable
    end
  end

  def rate!(stars, user_id = nil)
    if can_rate? user_id
      self.rating ||= self.class.ratable_class.new
      self.rating.ratings.build do |rating|
        rating.rate = stars
        rating.rater = user_id
      end
      self.rating.save
    end
  end

  def current_rating
    self.rating && self.rating.rating
  end

  # PLACEHOLDER
  def can_rate?(user_id)
    true
  end
end