# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email_address   :string           not null
#  username        :string           not null
#  display_name    :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#  index_users_on_username       (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "normalization and authentication" do
    let(:user) { FactoryBot.create(:user) }

    it "strips whitespace and downcases username" do
      authenticated_user = User.authenticate_by(username: "  #{user.username.upcase}  ", password: user.password)
      expect(authenticated_user).to eq(user)
    end

    it "fails to authenticate user with wrong password" do
      authenticated_user = User.authenticate_by(username: user.username, password: "wrongpassword")
      expect(authenticated_user).to be_nil
    end
  end
  
end
