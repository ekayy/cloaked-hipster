require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup" do
    before { visit new_user_registration_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_email",        with: "user@example.com"
        fill_in "user_password",     with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      it { should have_selector('Customize', text: 'Customize') }

      describe "after saving the user" do
        before { click_button submit }
        
        it { should have_selector('title', text: "name") }
      end
    end
  end
end
