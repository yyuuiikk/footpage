class AddColumnToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :category, :integer
  end
end
