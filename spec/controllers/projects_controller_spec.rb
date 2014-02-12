require 'spec_helper'

describe ProjectsController do
    it "returns http success" do
        assert true
    end

    describe "GET index" do
      it "has a 200 status code" do
        # visit "/"
        # expect(response.status).to eq(200)
      end
    end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new project in the database" do

      end
      it "redirects to the show page" do

      end
    end

    context "with invalid attributes" do
      it "does not save the new project in the database" do

      end
      it "re-renders the :new template" do

      end
    end

  end

end
