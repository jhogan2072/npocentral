require 'spec_helper'

describe "auctions/edit" do
  before(:each) do
    @auction = assign(:auction, stub_model(Auction,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit auction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", auction_path(@auction), "post" do
      assert_select "input#auction_name[name=?]", "auction[name]"
      assert_select "textarea#auction_description[name=?]", "auction[description]"
    end
  end
end
