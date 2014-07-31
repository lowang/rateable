require_relative 'minitest_helper'
require 'generators/rateable/templates/model'

class MainModel
  include Mongoid::Document
  include Rateable
  acts_as_rateable
end

describe Rateable do
  before { @model = MainModel.create }
  it 'must handle rating' do
    @model.rate!(5)
    @model.current_rating.must_equal 5.0
    rater_ip = '192.168.1.1'
    @model.rate!(1, rater_ip)
    @model.current_rating.must_equal 3.0
    @model.rating.rating_marks.select { |rm| rm.rater == rater_ip }.size.must_equal 1
  end

  it 'returns nil when no rates were casted' do
    @model.current_rating.must_equal nil
  end
end