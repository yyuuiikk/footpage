# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# ログ出力
set :output, "/home/vagrant/ruby/rails5.0.3/footpage/log/crontab.log"

# 実行環境
set :environment, :development

# 毎分実行
every 30.minutes do
	#command "date"
	#rake "task_scraping:delete_csv "
	#rake "task_scraping:scraping_soccerdigest_premier"
	#rake "task_scraping:scraping_soccerdigest_liga"
	#rake "task_scraping:scraping_soccerdigest_bundes"
	#rake "task_scraping:scraping_soccerdigest_serie"
  #rake "db:seed"
end

