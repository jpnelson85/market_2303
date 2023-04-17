require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor).to be_a(Vendor)
  end

  it 'has a name and array of inventory and check stock' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'can stock inventory' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.check_stock(item1)).to eq(0)
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.check_stock(item1)).to eq(30)
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end

  it 'potential revenue method' do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom") 
    vendor3 = Vendor.new("Palisade Peach Shack")  
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    vendor1.stock(item1, 35)    
    vendor1.stock(item2, 7)    
    vendor2.stock(item4, 50)    
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)  
    market.add_vendor(vendor1)    
    market.add_vendor(vendor2)    
    market.add_vendor(vendor3)
    expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
    expect(market.vendors_that_sell(item4)).to eq([vendor2])
  end
end