require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/"
      response.status.should be(200)
    end
  end
end