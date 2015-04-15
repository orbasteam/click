module ApplicationHelper
	def navi_li(title, path, match_controller)
		active = (match_controller == params[:controller]) ? 'active' : ''
		content_tag :li, link_to(title, path), class: active
	end
end
