class AddBodyAndTitleToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :body, :text, null: false
    add_column :questions, :title, :string, null: false, limit: 128
  end
end
