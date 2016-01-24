require 'rails_helper'

describe Order do
  context ".save_from_file" do
    let(:file_path) {"spec/fileset/example_input.tab"}

    it "Save values from file" do
      Order.save_from_file(file_path)

      expect(Order.where(purchaser_name: "João Silva")).to_not be_empty
      expect(Order.where(purchaser_name: "Amy Pond")).to_not be_empty
      expect(Order.where(purchaser_name: "Marty McFly")).to_not be_empty
      expect(Order.where(purchaser_name: "Snake Plissken")).to_not be_empty
    end
  end
end
