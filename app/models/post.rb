class Post < ApplicationRecord
  belongs_to :user

  # active storage
  has_one_attached :thumbnail
  has_one_attached :banner

  #active text
  has_rich_text :body

  #validations
  validates :title, length: {minimum: 3}
  validates :body, length: {minimum: 20}

  #per page 10 posts
  self.per_page = 10
  extend FriendlyId
  friendly_id :title, use: :slugged

  #resizing images
  def optimized_image(image,x,y)
	return image.variant(resize_to_fill: [x,y]).processed  	
  end
end
