require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :user_id => 2,
      :movie_id => 3,
      :content => "MyText",
      :create => "Create",
      :update => "Update",
      :destroy => "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Create/)
    expect(rendered).to match(/Update/)
    expect(rendered).to match(/Destroy/)
  end
end
