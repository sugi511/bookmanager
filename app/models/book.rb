class Book < ActiveRecord::Base
  has_one :study
  belongs_to :publisher
  has_and_belongs_to_many :categories
  attr_accessible :amazon_url, :author, :image_url, :published_on, :title, :version
end
