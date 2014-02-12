require 'spec_helper'

load "#{Rails.root}/db/seeds.rb"

describe "Project" do
  before do
    @user = User.create!(name: "jason1", email: "jason@example.com", password:"foobarar", password_confirmation: "foobarar")
  end
    it "Create is successful" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        click_link "New Project"
        fill_in "Name", :with => "Test Project"
        fill_in "Description", :with => "Test"
        click_button "Create Project"
        expect(page).to have_content("Test Project")
        expect(page).to have_content("Test")
        expect(page).to have_content("Waterfall")
    end

    it "Edit is successful" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        click_link "New Project"
        fill_in "Name", :with => "Test Project"
        fill_in "Description", :with => "Test"
        click_button "Create Project"

        click_link "Edit"
        expect(page).to have_content("Editing project")
        fill_in "Name", :with => "Bugshooters update"
        fill_in "Description", :with => "Bugshooters_update@cmu.edu"
        click_button "Update Project"
        expect(page).to have_content("Project was successfully updated.")
        expect(page).to have_content("Name: Bugshooters update")
        expect(page).to have_content("Description: Bugshooters_update@cmu.edu")
        expect(page).to have_content("Lifecycle type: Waterfall")
        expect(page).to have_content("Project phase:")
    end

    it "Show user 1" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        expect(page).to have_content("Project")
        expect(page).to have_content("Total Estimated Effort(Hours)")
        expect(page).to have_content("Total Effort(Hours)")
    end

    it "Show all projects" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        expect(page).to have_content("New Project")
    end

    it "Show settings" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        click_link "Settings"
        expect(page).to have_content("Editing user profile")
        expect(page).to have_content("Name")
        expect(page).to have_content("Email")
    end

    it "Back to user" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        click_link "Settings"
        click_link "Back"
        expect(page).to have_content("Project")
        expect(page).to have_content("Total Estimated Effort(Hours)")
        expect(page).to have_content("Total Effort(Hours)")
    end

    it "Show settings" do
        visit "/signin"
        fill_in "Email/Name", :with => "jason1"
        fill_in "Password", :with => "foobarar"
        click_button "Sign in"
        click_link "Settings"
        click_link "Show"
        expect(page).to have_content("New Project")
    end

end
