require "rails_helper"

describe "Orders" do
  it "uploads a file with many orders" do
    visit upload_orders_path
    attach_file('upload', File.absolute_path('spec/fileset/example_input.tab'))
    click_on "enviar"

    expect(page).to have_content "Upload feito com sucesso"
  end
end
