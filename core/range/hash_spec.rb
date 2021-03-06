require File.dirname(__FILE__) + '/../../spec_helper'

describe "Range#hash" do
  it "is provided" do
    (0..1).respond_to?(:hash).should == true
    ('A'..'Z').respond_to?(:hash).should == true
    (0xfffd..0xffff).respond_to?(:hash).should == true
    (0.5..2.4).respond_to?(:hash).should == true
  end
  
  it "generates the same hash values for Ranges with the same start, end and exclude_end? values" do
    (0..1).hash.should == (0..1).hash
    (0...10).hash.should == (0...10).hash
    (0..10).hash.should_not == (0...10).hash
  end
end
