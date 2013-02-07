class Article < ActiveRecord::Base
  attr_accessible :body, :caption, :slug, :subtitle, :title, :image, :retained_image, :remove_image
  image_accessor :image
end
