require 'rails_helper'

describe "Comments requests", type: :request do

  describe "#top_commenters" do

    before do
      create_list(:movie, 10)
      create_list(:user, 10)
      create_list(:comment, 50)
      visit "/comments/top_commenters"
      @counter = []
      page.find("table").find_all("tr")[1..-1].each do |row|
        @counter << row.find_all("td")[1].text
      end
    end

    it "displays top commenters in right order" do
      expect(@counter).to eq @counter.sort_by.to_a
    end

    it "display only 10 records" do
      expect(@counter.size).to eq 10
    end
  end
end
