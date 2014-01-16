class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories

	before_save :nomalize

	validates :category, presence: true

	private
	def nomalize
		self.category = category.downcase
	end
end
