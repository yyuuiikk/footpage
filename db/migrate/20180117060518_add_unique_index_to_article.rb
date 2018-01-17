class AddUniqueIndexToArticle < ActiveRecord::Migration[5.0]
  def change
		add_index :articles, [:title, :link], unique: true
  end
end
