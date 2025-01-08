class AddPublishDateToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :publish_date, :datetime
  end
end
