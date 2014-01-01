class Post < ActiveRecord::Base
  belongs_to :user

	has_many :post_categories
	has_many :categories, through: :post_categories

	accepts_nested_attributes_for :categories

	validates :user_id, :title, :content, presence:true
end
