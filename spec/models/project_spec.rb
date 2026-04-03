# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  status      :string
#  description :text
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is invalid without name" do
    project = FactoryBot.build(:project, name: nil)
    expect(project).to_not be_valid
  end
end
