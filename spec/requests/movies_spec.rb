require "rails_helper"

describe "Movies requests", type: :request do
  describe "movies list" do
    it "displays right title" do
      visit "/movies"
      expect(page).to have_selector("h1", text: "Movies")
    end
  end

  describe "top commenters lists" do
    it "displays top commenters in right order" do
      create_list(:movie, 10)
      create_list(:user, 10)
      create_list(:comment, 50)
      visit "/movies/top_commenters"
      counter = []
      page.find("table").find_all("tr")[1..-1].each do |row|
        counter << row.find_all("td")[1].text
      end
      expect(counter).to eq counter.sort_by.to_a
    end
  end
end
