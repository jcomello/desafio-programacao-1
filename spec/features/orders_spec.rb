require "rails_helper"

describe "Orders" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as user
  end

  it "uploads a file with many orders" do
    visit upload_orders_path
    attach_file('upload', File.absolute_path('spec/fileset/example_input.tab'))
    click_on "enviar"

    expect(page).to have_content "Upload feito com sucesso"
  end

  it "uploads a file and save orders" do
    visit upload_orders_path
    attach_file('upload', File.absolute_path('spec/fileset/example_input.tab'))
    click_on "enviar"

    expect(page).to have_content "João Silva"
    expect(page).to have_content "Amy Pond"
    expect(page).to have_content "Marty McFly"
    expect(page).to have_content "Snake Plissken"
  end

  it "shows the gross revenue by the file uploaded" do
    visit upload_orders_path
    attach_file('upload', File.absolute_path('spec/fileset/example_input.tab'))
    click_on "enviar"

    within ".gross-revenue" do
      expect(page).to have_content "95.0"
    end
  end
end
