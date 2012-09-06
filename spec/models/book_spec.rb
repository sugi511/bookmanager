require 'spec_helper'

describe Book do
  context 'index action' do
    before do
      @book = FactoryGirl.create(:book)
    end

    it "should show book title" do
      @book.title.should =~ /Programming/
    end

    it "should show book published on" do
      @book.published_on.to_s(:db).should =~ /\d\d\d\d-\d\d-\d\d/
    end

    it "should show study status belonging to the book" do
      FactoryGirl.create(:study)
      @study = @book.study
      @study.status.to_i.should == 1
    end

    it "should show categories which the book has" do
      4.times { FactoryGirl.create(:category) }
      4.times { FactoryGirl.create(:books_categories) }
      @categories = @book.categories

      @categories.each do |category|
        category.name.class.should == String
      end
    end

    after do

    end
  end
end
