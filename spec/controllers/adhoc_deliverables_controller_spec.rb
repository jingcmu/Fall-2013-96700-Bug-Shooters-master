require 'spec_helper'

describe AdhocDeliverablesController do

=begin
  it "routes to show page" do
     get :show
     response.should be_success
  end
=end


  it "renders new template" do
    get :new
    expect(response).to render_template("new")
  end

  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
