# spec/models/location_spec.rb

require 'rails_helper'

RSpec.describe Location, :type => :model do
  subject { Location.new }

  describe "latitude" do
    it "validates presence" do
      subject.validate
      expect(subject.errors[:latitude]).to include("can't be blank")
    end
  end

  describe "longitude" do
    it "validates presence" do
      subject.validate
      expect(subject.errors[:longitude]).to include("can't be blank")
    end
  end

  describe "address" do
    it "validates presence" do
      subject.validate
      expect(subject.errors[:address]).to include("can't be blank")
    end
  end

  describe "category" do
    it "validates presence" do
      subject.validate
      expect(subject.errors[:category]).to include("can't be blank")
    end
  end
end