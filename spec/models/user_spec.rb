require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
  
  it "must not be created with different password and password_corfimation" do
    @user = User.create(first_name: 'Sylvia', last_name: 'Almeida', email: 'sylvia@gmail.com', password: 'KkKk', password_confirmation: 'KtKk')

    expect(@user.errors.full_messages()).to eq ["Password confirmation doesn't match Password"]
  end

  it "must be created with same password and password_corfimation" do
    @user = User.create(first_name: 'Sylvia', last_name: 'Almeida', email: 'sylvia@gmail.com', password: 'KkKk', password_confirmation: 'KkKk')

    expect(User.find(@user.id)).not_to be_nil
  end

  it "must not be created with a email that have already been saved in DB, even case sensitive" do
    @user1 = User.create(first_name: 'Sylvia', last_name: 'Almeida', email: 'sylvia@gmail.com', password: 'KkKk', password_confirmation: 'KkKk')
    @user2 = User.create(first_name: 'Sylvia', last_name: 'Fontes', email: 'SYLVIA@gmail.com', password: 'PpPp', password_confirmation: 'PpPp')

    expect(@user2.errors.full_messages()).to eq ["Email has already been taken"]
  end

  it "must not be created without first name" do
    @user = User.create(first_name: nil, last_name: 'Almeida', email: 'sylvia@gmail.com', password: 'KkKk', password_confirmation: 'KkKk')

    expect(@user.errors.full_messages()).to eq ["First name can't be blank"]
  end

  it "must not be created without last name" do
    @user = User.create(first_name: 'Sylvia', last_name: nil, email: 'sylvia@gmail.com', password: 'KkKk', password_confirmation: 'KkKk')

    expect(@user.errors.full_messages()).to eq ["Last name can't be blank"]
  end

  it "must not be created without email" do
    @user = User.create(first_name: 'Sylvia', last_name: 'Almeida', email: nil, password: 'KkKk', password_confirmation: 'KkKk')

    expect(@user.errors.full_messages()).to eq ["Email can't be blank"]
  end

  it "must not be created with a password with less than minimum length" do 
    @user = User.create(first_name: 'Sylvia', last_name: 'Almeida', email: 'sylvia@gmail.com', password: 'KkK', password_confirmation: 'KkK')

    expect(@user.errors.full_messages()).to eq ["Password is too short (minimum is 4 characters)", "Password confirmation is too short (minimum is 4 characters)"]
  end

  end 
end
