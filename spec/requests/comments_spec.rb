require 'rails_helper'

RSpec.describe "Comments", type: :request do

  describe "Comments requests", type: :request do
    def login
      @user = FactoryBot.build(:user)
      @user.confirmed_at = Time.zone.now
      @user.save
      sign_in @user
    end

    let!(:movie) { FactoryBot.create(:movie) }

    describe "user logged in" do
      context "posted an comment before" do
        it "won't display comment form" do
          login
          FactoryBot.create(:comment, movie_id: movie.id, user_id: @user.id)
          visit movie_path(movie.id)
          expect(page).not_to have_selector('.comment_form')
        end
      end

      context "didn't posted comment before" do
        it 'display comment form' do
          login
          visit movie_path(movie.id)
          expect(page).to have_selector('.comment_form')
        end
      end
    end

    describe "user not logged in", :skip_before do
      it 'encourage user to register or login' do
        visit movie_path(movie.id)
        expect(page.text).to include("You have to sign up or sign in before writing a comment!")
      end
    end
  end
end
