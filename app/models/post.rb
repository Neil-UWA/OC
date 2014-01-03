class Post < ActiveRecord::Base
  belongs_to :user

	has_many :comments
	has_many :likes

	has_many :post_categories
	has_many :categories, through: :post_categories

	validates :user_id, :title, :content, presence:true
end
