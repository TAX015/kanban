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

FactoryBot.define do
  factory :user do
    email_address { "user@example.com" }
    password { "password" }
    username { "user" }
    display_name { "User" }
  end
end
