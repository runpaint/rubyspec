require File.dirname(__FILE__) + '/../../spec_helper'
require 'matrix'

describe "Matrix.columns" do
  before :each do
    @a = [1, 2]
    @b = [3, 4]
    @m = Matrix.columns([@a, @b])
  end
  
  it "creates a Matrix from argument columns" do
    @m.instance_of?(Matrix).should be_true
    @m.column(0).to_a.should == @a
    @m.column(1).to_a.should == @b
  end
end
