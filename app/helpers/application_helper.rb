module ApplicationHelper

	# ページ毎のタイトルを返す
	def full_title(page_title = '')
		base_title = "FootBall広場"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

end
