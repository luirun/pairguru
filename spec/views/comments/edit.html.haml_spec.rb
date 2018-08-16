require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :user_id => 1,
      :movie_id => 1,
      :content => "MyText",
      :create => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[movie_id]"

      assert_select "textarea[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[create]"

      assert_select "input[name=?]", "comment[update]"

      assert_select "input[name=?]", "comment[destroy]"
    end
  end
end
