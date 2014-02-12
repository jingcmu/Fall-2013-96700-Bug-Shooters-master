require 'spec_helper'
require 'lifecycle_phase'

describe LifecyclePhase do
   it "should belong to lifecycle" do
     subject.should belong_to(:lifecycle)
  end

   it 'should have a valid name' do
     lifecycle_phase = LifecyclePhase.create!(:name => "Requirements", :description => "Capturing Requirements", :lifecycle_id => 1)
     lifecycle_phase.name.should == 'Requirements'
   end

   it 'should not be valid without name' do
     subject.should_not be_valid
   end

   it 'should not be valid without a description'  do
     subject.should_not be_valid
   end

end
