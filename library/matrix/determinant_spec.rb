require File.dirname(__FILE__) + '/../../spec_helper'
require 'matrix'

describe "Matrix#determinant" do
  # Ruby versions less than 1.9.0, AFAICT, return the wrong determinant in
  # most non-trivial cases. As the rdoc for Matrix suggests, "require 'mathn'"
  # seems to fix this, but as Matrix doesn't require that library itself, the
  # bug remains. I've reported http://redmine.ruby-lang.org/issues/show/1516 ,
  # which is ostensibly about the documentation for #determinant not
  # reflecting this bug, but raises the question of why 1.8.7 doesn't handle
  # this properly.
  ruby_bug "#1516", "1.8.7" do
    it "returns the determinant of a square Matrix" do
      m = Matrix[ [7,6], [3,9] ]
      m.determinant.should == 45 

      m = Matrix[ [9, 8], [6,5] ]
      m.determinant.should == -3

      m = Matrix[ [9,8,3], [4,20,5], [1,1,1] ]
      m.determinant.should == 95
    end
  end  
  
  it "returns the determinant of a single-element Matrix" do  
    m = Matrix[ [2] ]
    m.determinant.should == 2
  end

  it "returns 0 for an empty Matrix" do
    m = Matrix[ [] ]
    m.determinant.should == 0
  end

  # Matrix#square? returns true if the first row of the matrix has the same
  # number of columns as the matrix has rows. This causes the .determinant
  # method to raise a NoMethodError for '-'. I've reported it as 
  # http://redmine.ruby-lang.org/issues/show/1515 . The guard is set to 2.0.0,
  # but currently all current MRI versions crash in this case. 
  it "returns 0 when the Matrix is not square" do
    m = Matrix[ [1], [2,3] ]
    m.determinant.should == 0

    m = Matrix[ [1,2,3], [4,2] ]
    m.determinant.should == 0
  end  

  ruby_bug "#1515", "2.0.0" do
    it "returns 0 when the Matrix is not square" do
      m = Matrix[ [1,2,3], [4,5], [6] ]
      m.determinant.should == 0

      m = Matrix[ [6], [5,4], [3,2,1] ]
      m.determinant.should == 0
    end
  end  
end
