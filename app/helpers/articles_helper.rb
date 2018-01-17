module ArticlesHelper

	# 日付の表記変換
	def convert_date(date)
		date.to_s.gsub(/(-)/, ".")
	end
end
