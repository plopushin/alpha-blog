class Article < ActiveRecord::Base
  #ensures that there is a title.
  #be sure to reload!
  belongs_to :user
  has_many :article_categories
  #has many categories through article categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 300}
  validates :user_id, presence: true
end 