require 'nokogiri'
require 'open-uri'
require 'csv'

# スクレイピング対象
site_top_url = 'http://www.soccerdigestweb.com'
search_liga_url = '/tag_list/tag_search=1&tag_id=36'
# csvファイル
csv_file = "/home/vagrant/ruby/rails5.0.3/footpage/db/csv/site_info.csv"
# csv出力のための配列
site_info = []
# CSVファイルを空に
CSV.open(csv_file, "w") do |csv|
	csv = nil
end

# Nokogiriでページ情報を取得
charset = nil
html = open(site_top_url + search_liga_url) do |f|
	charset = f.charset
	f.read
end
doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('//div[@class="entry"]').each do |node|
	# 1記事ずつ取得するために配列を初期化
	site_info = []
	# 日付/サムネイル/記事タイトル/記事リンク/サイト名/サイトトップのURL/カテゴリーコード の取得
	site_info << node.css('span[class="date"]').inner_text.gsub(/([年月])/, "-").gsub(/(日)/, "") \
						<< site_top_url + node.css('img').attribute('src').value \
						<< node.css('p[class="title"]').inner_text \
						<< node.css('p[class="title"]/a').attribute('href').value \
						<< doc.css('link[rel="home"]').attribute('title').value \
						<< site_top_url	\
						<< 1

	# 追記モードでcsvファイルに書き込む
	CSV.open(csv_file, "a") do |csv|
		csv << site_info
	end

end

