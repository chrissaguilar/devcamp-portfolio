module Placeholder
  extend_object ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://placehold.it/#{height}x#{width}"
  end
end