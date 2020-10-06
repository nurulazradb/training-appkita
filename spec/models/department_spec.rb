require 'rails_helper'

RSpec.describe Department, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = 'first department'

    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil

    expect(subject).to be_invalid
  end
end
