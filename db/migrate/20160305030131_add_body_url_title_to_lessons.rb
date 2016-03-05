class AddBodyUrlTitleToLessons < ActiveRecord::Migration
  def change
		add_column :lessons, :title, :string, null: false
		add_column :lessons, :url, :string, null: false
		add_column :lessons, :body, :text, null: false
  end
end
