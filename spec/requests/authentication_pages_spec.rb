require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "login page" do
  	before { visit new_user_session_path }

  	it { should have_selector('h1', text: 'Login') }
  	it { should have_selector('title', text: 'Login') }
  end

  describe "signin" do
  	before { visit new_user_session_path }

  	describe "with invalid information" do
  		before { click_button 'Login' }

  		it { should have_selector('title', text: 'Login') }
  	end

  	describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "user_email",    with: user.email
        fill_in "user_password", with: user.password
        click_button 'Login'
      end

			it { should have_link('Customize Page', href: edit_user_path(user)) }
			it { should have_link('Settings', href: edit_user_registration_path) }
      it { should have_link('Logout', href: destroy_user_session_path) }
      it { should_not have_link('Login', href: new_user_session_path) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Login') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(new_user_session_path) }
        end
      end
    end
  end
end