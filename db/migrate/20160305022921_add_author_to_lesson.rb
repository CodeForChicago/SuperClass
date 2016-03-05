class AddAuthorToLesson < ActiveRecord::Migration
  def change
		add_column :lessons, :author, :string, null: false
  end
end
