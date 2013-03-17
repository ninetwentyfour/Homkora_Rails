require 'spec_helper'

describe Timer do
  before(:each) do
    @timer = Fabricate.build(:timer)
  end
  
  describe "relations" do
    it{ should belong_to(:project) }
  end
  
  describe "validations" do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:description)}
  end
  
  describe "comma" do
    it "should return a csv for the object" do
      @timer.to_comma.should_not be_blank
    end
  end
end
