require 'checkout'
require 'promotional_rules'

describe 'checkout' do

  it 'should price 001,002,003' do
    co = Checkout.new(PromotionalRules)
    co.scan("001")
    co.scan("002")
    co.scan("003")
    expect(co.total).to eq("66.78")
  end

  it 'should price 001,003,001' do
    co = Checkout.new(PromotionalRules)
    co.scan("001")
    co.scan("003")
    co.scan("001")
    expect(co.total).to eq("36.95")
  end

  it 'should price 001,002,001,003' do
    co = Checkout.new(PromotionalRules)
    co.scan("001")
    co.scan("002")
    co.scan("001")
    co.scan("003")
    expect(co.total).to eq("73.76")
  end

end