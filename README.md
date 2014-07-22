# Rateable

Simple mongoid rating "plugin", stores rates in separate collection instead of embedding them.

## Why?

because I want my rates to be separate from rated objects, also it isn't common use case to access ratings
so spending few ms to perform another query once a while is ok.
Otherwise I would highly recommend embedding rates inside your objects,
maybe using sth like: https://github.com/proton/mongoid_rateable/

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
