# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# ログ出力
set :output, "/home/vagrant/ruby/rails5.0.3/footpage/log/crontab.log"

# 実行環境
set :environment, :development

# 毎分実行
every 1.minute do
	command "date"
  command "/home/vagrant/.rbenv/shims/ruby /home/vagrant/ruby/rails5.0.3/footpage/db/soccer_digest_premier.rb"
  rake "db:seed"
end

