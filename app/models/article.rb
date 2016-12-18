class Article < ActiveRecord::Base
  #ensures that there is a title.
  #be sure to reload!
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 300}
end 