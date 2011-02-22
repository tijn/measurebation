require 'rspec'
require File.expand_path(File.dirname(__FILE__) + "/../lib/measurebation")

include Measurebation

describe Histogram do
  before :all do
    @h = Histogram.new(0..1_000, 10)
    @h.count(141)
    @h.count(2621)
  end

  it "should have the correct amount of bins" do
    @h.bins.size.should == 100
    @h.to_a.size.should > 100
    @h.to_a.size.should == 102 # + bigger and smaller
  end

  it "should count values in the correct bins" do
    @h.to_a[15].last.should == 1
    @h.bigger.should == 1
  end

  it "should be able to values" do
    @h.to_s.split("\n").size.should == 102
  end

end

