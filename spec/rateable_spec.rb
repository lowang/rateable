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
    @model.rate!(1)
    @model.current_rating.must_equal 3.0
  end

  it 'returns nil when no rates were casted' do
    @model.current_rating.must_equal nil
  end
end