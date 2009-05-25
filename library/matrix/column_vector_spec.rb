require File.dirname(__FILE__) + '/../../spec_helper'
require 'matrix'

describe "Matrix.column_vector" do

  it "returns a single column Matrix when called with an Array" do
    @m = Matrix.column_vector([4,5,6])
    @m.instance_of?(Matrix).should be_true
    @m.should == Matrix[ [4],[5],[6] ]

    @m = Matrix.column_vector([])
    @m.instance_of?(Matrix).should be_true
    @m.should == Matrix[]
  end

  it "returns a single column Matrix when called with a number" do
    @m = Matrix.column_vector(4)
    @m.instance_of?(Matrix).should be_true
    @m.should == Matrix[ [4] ]

    @m = Matrix.column_vector(0.98887)
    @m.instance_of?(Matrix).should be_true
    @m.should == Matrix[ [0.98887] ]
  end
end
