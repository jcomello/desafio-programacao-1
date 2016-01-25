require 'rails_helper'

describe Order do
  context ".gross_revenue" do
    let(:first_item)    { FactoryGirl.create(:item, price: 30.0) }
    let(:second_item)   { FactoryGirl.create(:item, price: 25.0) }
    let!(:first_order)  { FactoryGirl.create(:order, purchase_count: 2, item: first_item) }
    let!(:second_order) { FactoryGirl.create(:order, purchase_count: 3, item: second_item) }

    it "returns gross revenue based in saved itens" do
      expect(Order.gross_revenue).to eq(135.0)
    end
  end
end
