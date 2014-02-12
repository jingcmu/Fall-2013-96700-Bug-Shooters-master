require 'spec_helper'
require 'lifecycle'

describe Lifecycle do
  #it {should have_many(:projects)}

   it 'name of it should be correct' do
        lifecycle = Lifecycle.create!(:name => "Waterfall")
        lifecycle.name.should == 'Waterfall'
    end

    it 'should not be valid without name' do
        subject.should_not be_valid
    end

    it 'should be valid with name' do
        lifecycle = Lifecycle.new(:name => "Waterfall")
        lifecycle.should be_valid
    end

    it 'count should be changed by 1' do
        lifecycle = Lifecycle.new(:name => "Waterfall")
        prevCount = Lifecycle.count
        lifecycle.save
        Lifecycle.count.should be prevCount + 1
    end

    it 'should resond to name' do
        subject.should respond_to(:name)
    end

    it 'should not be valid without type_id' do
        subject.should_not be_valid
    end
end
