FactoryGirl.define do
  factory :order do
    purchase_count 1
    purchaser
    item
    merchant
  end
end
