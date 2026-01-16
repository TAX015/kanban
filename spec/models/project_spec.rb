require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is invalid without name" do
    project = FactoryBot.build(:project, name: nil)
    expect(project).to_not be_valid
  end
end
