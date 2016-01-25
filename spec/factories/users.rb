FactoryGirl.define do
  factory :user do
    sequence(:email) { |number| "email#{number}@blalba.com" }
    password "123123123"
  end

end
