require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market).to be_a(Market)
  end

  it 'has attributes' do
    market = Market.new("South Pearl Street Farmers Market")   
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it 'add vendors method' do
    market = Market.new("South Pearl Street Farmers Market")   
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    market.add_vendor(vendor1)
    expect(market.vendors).to eq([vendor1])
    vendor2 = Vendor.new("Ba-Nom-a-Nom")    
    vendor3 = Vendor.new("Palisade Peach Shack")
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
  end

  it 'vendor names method' do
    market = Market.new("South Pearl Street Farmers Market")   
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    market.add_vendor(vendor1)
    vendor2 = Vendor.new("Ba-Nom-a-Nom")    
    vendor3 = Vendor.new("Palisade Peach Shack") 
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end
end