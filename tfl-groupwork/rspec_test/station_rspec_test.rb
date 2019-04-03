require 'minitest/autorun'
require './test_helper.rb'

describe Station do

  before do
    @Charing_Cross = Station.new('Charing Cross')
    @Victoria_line = Line.new('Victoria')
  end

  describe "creating a station" do
    it "should have a name attribute" do
      @station.name.must_equal('charing Cross')
    end
  end

  describe "adding line" do
    it "should be able to be assigned to a line" do
      @station.add_line(@line)
      @station.line.must_equal([@line])
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
