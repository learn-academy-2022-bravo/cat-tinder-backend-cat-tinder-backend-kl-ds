require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "should validate a name" do
    dog = Dog.create
    expect(dog.errors[:name]).to_not be_empty
  end
  it "should validate a age" do
    dog = Dog.create
    expect(dog.errors[:age]).to_not be_empty
  end
end
