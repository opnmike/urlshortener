require 'rails_helper'

RSpec.describe "urls/new", type: :view do
  before(:each) do
    assign(:url, Url.new(
      :original_url => "MyText",
      :short_url => "MyString"
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "textarea#url_original_url[name=?]", "url[original_url]"

      assert_select "input#url_short_url[name=?]", "url[short_url]"
    end
  end
end
