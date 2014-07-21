# Rateable

Simple mongoid rating "plugin", stores rates in separate collection instead of embedding them

## Installation

Add this line to your application's Gemfile:

    gem 'rateable'

And then execute:

    $ bundle

## Usage
    $ rails generate rateable
          create  app/models/rate.rb

    class MyModel
      include Mongoid::Document
      include Rateable
      acts_as_rateable
    end

    @model = MyModel.first
    @model.rate!(5)
    @model.current_rating
    => 3.0

## Contributing

1. Fork it ( http://github.com/lowang/rateable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
