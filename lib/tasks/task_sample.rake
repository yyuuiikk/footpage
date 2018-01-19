namespace :task_sample do
	desc "実行処理の説明"
	task :sample_source do
		name = 'Alice'
		puts "Hello, #{name}"
		puts Rails.root.to_s
	end
end
