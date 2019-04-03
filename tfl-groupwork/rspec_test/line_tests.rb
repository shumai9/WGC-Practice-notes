require 'minitest/autorun'
require './test_helper'

before do
  @line = Line.new('victoria')
  @oxford_circus = Station.new('oxford circus')
  @warren_street = Station.new('warren_street')
end

describe Line  do
  describe "create a line" do
   it  "should have a name attribute" do
    #line = Line.new("Victoria")
    @line.name.must_equal('Victoria')
    end
  end
 
  describe "having stations" do
    it "should have stations" do
      @line.station.Class.must_equal(Array)
    end
  
    it "should allow adding stations" do
      @line.add_station(@oxford_circus)
      @line.station.must_equal([@oxford_circus])
    end
 

    it "should preserve order of stations" do
      @line.add_station(@oxford_circus)
      @line.add_station(@warren_street)
      @line.station.must_equal([@oxford_circus, @warren_street])
    end
  end

  describe "finding a route" do
    before do
      @oval = Station.new ('oval')
      @angel = Station.new('angle')
      @random = Station.new('random')
      @victoria_line.add_station(@charing_cross)
      @victoria_line.add_station(@oval)
      @victoria_line.add_station(@angle)
      @victoria_line.add_station(@camden)
    end
      it "should return a list of stations between two points" do
    end
  end
end
