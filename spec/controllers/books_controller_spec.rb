require 'rails_helper'

RSpec.describe BooksController, type: :controller do

 describe 'GET #show' do
   let(:user) {User.create(email: "test@gmail.com")}
   let(:category) { Category.create(name: "Criminal")}
   let(:book) {Book.create(user: user, category: category, title: "test", author: "test", description: "test", book_img_file_name: "sleeping.jpg")}
   subject {get :show, params: {id: id}}
   context 'should assign book when valid id' do
     let(:id) { book.id }
     before { subject }
     it { expect(assigns(:book)).to eq(book)}
   end
   context 'should raise error when invalid id' do
     let(:id) { 'abc' }
     it {expect { subject }.to raise_error(ActiveRecord::RecordNotFound)}
   end
 end

  # describe 'POST #create' do
  #     let!(:params) { { book: build(:book).attributes } }
  #     subject { post :create, params }
  #
  #     context 'success' do
  #       it { is_expected.to redirect_to root_path(controller.book) }
  #
  #
  #       it 'creates student' do
  #         expect{ subject }.to change(Book.count).by(1)
  #       end
  #     end



end
