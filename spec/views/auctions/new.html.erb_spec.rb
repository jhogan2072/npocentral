require 'spec_helper'

describe "auctions/new" do
  before(:each) do
    assign(:auction, stub_model(Auction,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new auction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", auctions_path, "post" do
      assert_select "input#auction_name[name=?]", "auction[name]"
      assert_select "textarea#auction_description[name=?]", "auction[description]"
    end
  end
end
