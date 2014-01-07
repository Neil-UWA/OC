module ApplicationHelper
	def markdown(text)
		if text
			markdown = 	Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(hard_wrap:true))
		end
		markdown.render(text).html_safe
	end 
end
