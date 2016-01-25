require 'rails_helper'

describe OrderFile do
  let(:file_path) { "spec/fileset/example_input.tab" }
  let(:duplicated_file_path) { "spec/fileset/duplicated_input.tab" }

  context ".inserted_orders" do
    it "returns the orders inserted by the file" do
      OrderFile.save_from_file(file_path)

      expect(OrderFile.inserted_orders.count).to eq 4
    end

    it "does not return duplicated orders" do
      OrderFile.save_from_file(duplicated_file_path)

      expect(OrderFile.inserted_orders.count).to eq 3
    end
  end

  context ".save_from_file" do
    let(:file_path) { "spec/fileset/example_input.tab" }
    let(:duplicated_file_path) { "spec/fileset/duplicated_input.tab" }

    context "Purchaser" do
      it "Save purchaser values from file" do
        OrderFile.save_from_file(file_path)

        expect(Purchaser.where(name: "João Silva")).to_not be_empty
        expect(Purchaser.where(name: "Amy Pond")).to_not be_empty
        expect(Purchaser.where(name: "Marty McFly")).to_not be_empty
        expect(Purchaser.where(name: "Snake Plissken")).to_not be_empty
      end

      it "does not save duplicated inputs" do
        OrderFile.save_from_file(duplicated_file_path)

        expect(Purchaser.where(name: "João Silva").count).to eq 1
      end
    end

    context "Item" do
      it "Save item values from file" do
        OrderFile.save_from_file(file_path)

        expect(Item.where(description: "R$10 off R$20 of food", price: "10.0")).to_not be_empty
        expect(Item.where(description: "R$30 of awesome for R$10", price: "10.0")).to_not be_empty
        expect(Item.where(description: "R$20 Sneakers for R$5", price: "5.0")).to_not be_empty
        expect(Item.where(description: "R$20 Sneakers for R$5", price: "5.0")).to_not be_empty
      end

      it "does not save duplicated inputs" do
        OrderFile.save_from_file(duplicated_file_path)

        expect(Item.where(description: "R$10 off R$20 of food").count).to eq 1
      end
    end

    context "Merchant" do
      it "Save merchant values from file" do
        OrderFile.save_from_file(file_path)

        # João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza
        # Amy Pond	R$30 of awesome for R$10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
        # Marty McFly	R$20 Sneakers for R$5	5.0	1	123 Fake St	Sneaker Store Emporium
        # Snake Plissken	R$20 Sneakers for R$5	5.0	4	123 Fake St	Sneaker Store Emporium

        expect(Merchant.where(name: "Bob's Pizza", address: "987 Fake St")).to_not be_empty
        expect(Merchant.where(name: "Tom's Awesome Shop", address: "456 Unreal Rd")).to_not be_empty
        expect(Merchant.where(name: "Sneaker Store Emporium", address: "123 Fake St")).to_not be_empty
        expect(Merchant.where(name: "Sneaker Store Emporium", address: "123 Fake St")).to_not be_empty
      end

      it "does not save duplicated inputs" do
        OrderFile.save_from_file(file_path)

        expect(Merchant.where(name: "Sneaker Store Emporium", address: "123 Fake St").count).to eq 1
      end
    end
  end
end
