require 'spec_helper'

describe Book do
  context 'index action' do
    before do
      @title = "Programming hoge"
      @published_on = "2012-01-01"

      Book.create(title: @title, published_on: @published_on)
      @book = Book.last
    end

    it "should show book title" do
      @book.title.should == @title
    end

    it "should show book published on" do
      @book.published_on.to_s(:db).should == @published_on
    end

    it "should show study status belonging to the book" do
      Study.create(book_id: @book.id,status: 1)
      @study = @book.study
      @study.status.to_i.should == 1
      Study.delete(@study.id)
    end

    it "should show categories which the book has" do
      Category.create(id: 1,name:"HTML")
      Category.create(id: 2,name:"CSS")
      BooksCategories.create(book_id: @book.id,category_id: 1)
      BooksCategories.create(book_id: @book.id,category_id: 2)
      @categories = @book.categories
      @categories.each do |category|
        category.name.should =~ /HTML|CSS/
      end
      Category.delete(1)
      Category.delete(2)
    end

    after do
      Book.delete(@book.id)
    end
  end
end
