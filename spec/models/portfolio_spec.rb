require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it "validates the portfolio" do 
    user =  User.create(name: "test", email: "test@mail.com", username: 'test123', password: 'test@123')
    portfolio = Portfolio.new(user_id:user.id, title:"test's portfolio")
    expect(portfolio.save).to eq(true)
  end

  it "validates the presence of title" do
    portfolio = Portfolio.new()
    expect(portfolio.save).to eq(false)
  end

  it "validates the has_many stocks association" do 
    association = Portfolio.reflect_on_association(:stocks)
    expect(association.macro).to eq(:has_many)
  end

  it "validates the belongs_to association" do 
    association = Portfolio.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
end
