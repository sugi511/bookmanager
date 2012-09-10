require 'spec_helper'

describe BooksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    context "show records" do
      before do
        @books = []
        3.times do |n| 
          @books << FactoryGirl.create(:book)
          FactoryGirl.create(:study)
          FactoryGirl.create(:category)
          FactoryGirl.create(:books_categories)
        end

      end

      it "should have all book record with id" do
        @books.each_with_index do |book, idx|
          book.id.should == idx + 1
        end
      end

      it "should have accosiation between book and study" do
        @books[0].study.status.should_not == nil
      end

      it "should have accosiation between book and tags" do
        @categories = @books[0].categories
        @categories.each do |category|
          category.should_not == nil
        end
      end
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
