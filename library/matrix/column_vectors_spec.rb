require File.dirname(__FILE__) + '/../../spec_helper'
require 'matrix'

describe "Matrix#column_vectors" do
  it "returns an Array of column Vectors" do
    @m = Matrix[ *[ [1,2], [3,4] ] ]
    @v = @m.column_vectors
    @v.instance_of?(Array).should be_true
    @v.all? {|v| v.instance_of?(Vector).should be_true }
    @v.should == [Vector[1,3], Vector[2,4]]

    Matrix[ [] ].column_vectors.should == []
  end
end
