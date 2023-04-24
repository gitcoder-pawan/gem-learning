require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:user) {  User.create(name: "test", email: "test@mail.com", username: 'test123', password: 'test@123') }
  let (:portfolio) { Portfolio.create(user_id: user.id, title:"test's portfolio") }

  it "validtes the stock" do 
    stock = Stock.new(portfolio_id:portfolio.id,symbol:"TSLA",purchase_price:436.00,quantity:50,remaining:50)
  end

  it "validates presencce of symbol" do 
    stock = Stock.new(portfolio_id:portfolio.id, purchase_price:436.00,quantity:50,remaining:50)
    expect(stock.save).to eq(false)
  end

  it "validates presencce of purchase_price" do 
    stock = Stock.new(portfolio_id:portfolio.id,symbol:"Test",quantity:50,remaining:50)
    expect(stock.save).to eq(false)
  end

  it "validates presencce of quantity" do 
    stock = Stock.new(portfolio_id:portfolio.id,symbol: 'Test', purchase_price:436.00,remaining:50)
    expect(stock.save).to eq(false)
  end

  it "validates presencce of reamining" do 
    stock = Stock.new(portfolio_id:portfolio.id,symbol: 'Test',  purchase_price:436.00,quantity:50)
    expect(stock.save).to eq(false)
  end

  it "validates the association" do 
    association = Stock.reflect_on_association(:portfolio)
    expect(association.macro).to eq(:belongs_to)
  end
end
