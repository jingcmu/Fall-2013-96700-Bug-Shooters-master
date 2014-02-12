require 'spec_helper'
require 'project'

# describe Project do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Project do
  it {should have_many(:deliverables)}
  #it {should belong_to(:lifecycle)}

  it 'should be valid' do
    req = Project.create!(name: "Crossmobile", description: "Building a private mobile network")
    req.valid?
  end

  before { @project = Project.new(name: "Testing",
                                  description: "This is testing project",
                                  )
  }
  subject { @project }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
end

