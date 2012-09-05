class CreateBooksCategories < ActiveRecord::Migration
  def change
    create_table :books_categories,:id => false do |t|
      t.references :book
      t.references :category
    end
    add_index :books_categories, :book_id
    add_index :books_categories, :category_id
  end
end
