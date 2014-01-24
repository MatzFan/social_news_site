class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user, index: true
      t.text :content

      t.timestamps
    end
    add_foreign_key(:articles, :users)
  end
end
