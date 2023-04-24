require 'rails_helper'
RSpec.describe User, type: :model do
  it "test for valid user" do
    user = User.new(name: "test", email: "test@mail.com", username: 'test123', password: 'Pawan#2000')
    expect(user.save).to eq(true)
  end

  it "validates the presence of name " do 
    user = User.new(email: "test@mail.com", username: 'test123', password: 'Pawan#2000')
    expect(user.save).to eq(false)
  end

  it "validates the presence of email " do 
    user = User.new(name: 'test', username: 'test123', password: 'Pawan#2000')
    expect(user.save).to eq(false)
  end

  it "validates the presence of username " do 
    user = User.new(name: 'test', email: "test@mail.com", password: 'Pawan#2000')
    expect(user.save).to eq(false)
  end

  it "validates the presence of password " do 
    user = User.new(name: 'test', email: "test@mail.com", username: 'test123')
    expect(user.save).to eq(false)
  end

  it "is not valid with a duplicate email" do
    User.create(name: "test", email: "test@mail.com", username: 'test123', password: 'test@123')
    user = User.new(name: "test", email: "test@mail.com", username: 'test123', password: 'Pawan#2000')
    expect(user).to_not be_valid
  end

  it "has many portfolios" do
    association = User.reflect_on_association(:portfolios)
    expect(association.macro).to eq(:has_many)
  end

  it "has many stocks through portfolio" do
    association = User.reflect_on_association(:stocks)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:portfolios)
  end
end