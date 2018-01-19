namespace :task_scraping do

	#####  Class定義
	require 'nokogiri'
	require 'open-uri'
	require 'csv'
	
	class Scrape
	
		attr_reader :domain, :search_url, :category
	
		# csvファイル
		CSV_FILE = Rails.root.to_s + "db/csv/site_info.csv"
	
		def initialize(domain, search_url, category)
			# スクレイピング対象
			@site_url = 'http://' + domain + '/'		## ex. example.com
			@search_url = search_url								## ex. ?tag_id=35
			@category = category										## ex. 0
		end
	
		def remove_csv
			# CSVファイルを空に
			CSV.open(CSV_FILE, "w") do |csv|
				csv = nil
			end
		end
	
		def scraping_site
			# Nokogiriでページ情報を取得
			charset = nil
			html = open(@site_url + @search_url) do |f|
				charset = f.charset
				f.read
			end
			doc = Nokogiri::HTML.parse(html, nil, charset)
			
			doc.xpath('//div[@class="entry"]').each do |node|
				# 1記事ずつ取得するために配列を初期化
				site_info = []
				# 日付/サムネイル/記事タイトル/記事リンク/サイト名/サイトトップのURL/カテゴリーコード の取得
				site_info << node.css('span[class="date"]').inner_text.gsub(/([年月])/, "-").gsub(/(日)/, "") \
									<< @site_url + node.css('img').attribute('src').value \
									<< node.css('p[class="title"]').inner_text \
									<< node.css('p[class="title"]/a').attribute('href').value \
									<< doc.css('link[rel="home"]').attribute('title').value \
									<< @site_url	\
									<< @category
			
				# 追記モードでcsvファイルに書き込む
				CSV.open(CSV_FILE, "a") do |csv|
					csv << site_info
				end
			end
		end
	end
	#####

	desc "CSVファイル削除"
	task :delete_csv do
		some = Scrape.new('', '', 0)
		some.remove_csv
	end

	desc "サッカーダイジェスト：プレミア"
	task :scraping_soccerdigest_premier do
		premier = Scrape.new('www.soccerdigestweb.com', 'tag_list/tag_search=1&tag_id=35', 0)
		premier.scraping_site
	end

	desc "サッカーダイジェスト：リーガ"
	task :scraping_soccerdigest_liga  do
		liga = Scrape.new('www.soccerdigestweb.com', 'tag_list/tag_search=1&tag_id=36', 1)
		liga.scraping_site
	end

	desc "サッカーダイジェスト：ブンデス"
	task :scraping_soccerdigest_bundes do
		bundes = Scrape.new('www.soccerdigestweb.com', 'tag_list/tag_search=1&tag_id=38', 2)
		bundes.scraping_site
	end

	desc "サッカーダイジェスト：セリエ"
	task :scraping_soccerdigest_serie do
		serie = Scrape.new('www.soccerdigestweb.com', 'tag_list/tag_search=1&tag_id=35', 3)
		serie.scraping_site
	end

end
