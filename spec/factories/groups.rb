# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  deleted_at  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :group do
    name { "MyString" }
    description { "MyText" }
    deleted_at { "2026-04-05" }
  end
end
