class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.date :date
      t.text :thumnail
      t.string :title
      t.text :link
      t.string :site_name
      t.text :site_top

      t.timestamps
    end
  end
end
