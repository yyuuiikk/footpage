class Article < ApplicationRecord
	validates :title, uniqueness: { scope: [:link] }
end
