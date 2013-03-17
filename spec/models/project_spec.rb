require 'spec_helper'

describe Project do
  before(:each) do
    @project = Fabricate.build(:project)
  end
  
  describe "relations" do
    it{ should belong_to(:user) }
    it{ should have_many(:timers) }
  end
  
  describe "validations" do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:description)}
  end
  
  describe "add_time_together" do
    it "should add together two times" do
      time = @project.add_time_together("00:00:48","00:30:12")
      time.should == "00:31:00"
    end
    
    it "should handle rolling over to minutes" do
      time = @project.add_time_together("00:00:48","00:00:12")
      time.should == "00:01:00"
    end
    
    it "should handle rolling over to hours" do
      time = @project.add_time_together("00:58:00","00:02:00")
      time.should == "01:00:00"
    end
    
    it "should handle 100 hours" do
      time = @project.add_time_together("85:00:00","15:00:00")
      time.should == "100:00:00"
    end
    
    it "should handle 1000 hours" do
      time = @project.add_time_together("885:00:00","115:00:00")
      time.should == "1000:00:00"
    end
  end
  
  describe "comma" do
    it "should return a csv for the object" do
      @project.to_comma.should_not be_blank
    end
  end
end
