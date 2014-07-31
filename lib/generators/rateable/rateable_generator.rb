class RateableGenerator < Rails::Generators::Base

  def self.source_root
    @_acts_as_commentable_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def create_model_file
    template "model.rb", "app/models/rating.rb"
  end
end