require 'spec_helper'
require 'deliverable_type'

describe DeliverableType do
    it 'name of it should be correct' do
        deliverableType = DeliverableType.create!(:name => "Design doc")
        deliverableType.name.should == 'Design doc'
    end

    it 'should not be valid without name' do
        subject.should_not be_valid
    end

    it 'should be valid with name' do
        deliverableType = DeliverableType.new(:name => "Requirement doc")
        deliverableType.should be_valid
    end

    it 'count should be changed by 1' do
        deliverableType = DeliverableType.new(:name => "Design doc")
        prevCount = DeliverableType.count
        deliverableType.save
        DeliverableType.count.should be prevCount + 1
    end

    it 'should respond to name' do
        subject.should respond_to(:name)
    end

end
