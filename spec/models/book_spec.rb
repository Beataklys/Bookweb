require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) {User.create(email: "test@gmail.com")}
  let(:category) { Category.create(name: "Criminal")}

  it "is valid with user, title, author, description and book_img" do
    book= Book.new(user: user, category: category, title: "test", author: "test", description: "test", book_img_file_name: "sleeping.jpg")
    expect(book).to be_valid
  end

  it "is invalid without user" do
    book= Book.new
    book.valid?
    expect(book.errors[:user]).to include("must exist")
  end

  it "is invalid without title" do
    book= Book.new
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "is invalid without author" do
    book = Book.new
    book.valid?
    expect(book.errors[:author]).to include("can't be blank")
  end
  it "is invalid without description" do
    book= Book.new
    book.valid?
    expect(book.errors[:description]).to include("can't be blank")
  end


end
