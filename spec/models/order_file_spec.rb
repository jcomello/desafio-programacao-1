require 'rails_helper'

describe OrderFile do
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
  end
end
