module ApplicationHelper
	def navi_li(title, path, match_controller)
		"<li #{ 'class="active"' if match_controller == params[:controller] }>#{link_to title, path}</li>".html_safe
	end
end
