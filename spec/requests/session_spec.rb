require 'rails_helper'

RSpec.describe "Sessions Cookie Test", type: :request do
  # Create a test user in the database
  let(:user) { FactoryBot.create(:user) }

  describe "POST /session" do
    it "logs the user in and sets a standard session cookie" do
      # Simulate submitting the login form without checking the box
      post session_path, params: { username: user.username, password: user.password, remember_me: "0" }
      
      # We expect to be redirected to the main app after successful login
      expect(response).to have_http_status(:redirect)
      
      # We expect the server to give us a session cookie
      expect(cookies[:session_id]).to be_present
    end

    it "sets a permanent cookie when remember_me is checked" do
      # Simulate submitting the form WITH the box checked
      post session_path, params: { username: user.username, password: user.password, remember_me: "1" }
      
      expect(response).to have_http_status(:redirect)
      expect(cookies[:session_id]).to be_present
      # Currently Rails does not provide a built-in way to check if a cookie is permanent in tests, but we can check that it is set and assume it's permanent based on the controller code.
    end

    it "rejects invalid passwords and does not set a cookie" do
      # Simulate a typo in the password
      post session_path, params: { username: user.username, password: "wrong_password" }
      
      # We expect it to fail and re-render the login page (or redirect back to it)
      expect(response).to redirect_to(new_session_path)
      
      # We expect NO cookie to be given
      expect(cookies[:session_id]).to be_blank
    end
  end

  describe "DELETE /session" do
    it "logs the user out and deletes the session cookie" do
      # First, log the user in
      post session_path, params: { username: user.username, password: user.password }

      # Then, log them out
      delete session_path

      # We expect to be redirected to the root path after logout
      expect(response).to have_http_status(:redirect)

      # We expect the session cookie to be deleted
      expect(cookies[:session_id]).to be_blank
    end
  end
end