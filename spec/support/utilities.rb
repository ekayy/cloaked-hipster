include ApplicationHelper

def log_in(user)
  visit new_user_session_path
  fill_in "user_email",    with: user.email
  fill_in "user_password", with: user.password
  click_button "Login"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end
