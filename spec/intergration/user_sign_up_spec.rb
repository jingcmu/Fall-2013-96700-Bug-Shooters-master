require 'spec_helper'

describe "Create user" do
    it "Sign up is successful" do
        visit "/signup"
        fill_in "Name", :with => "Bugshooters"
        fill_in "Email", :with => "Bugshooters@cmu.edu"
        fill_in "Password", :with => "12345678"
        fill_in "Confirmation", :with => "12345678"
        click_button "Create User"
        expect(page).to have_content("Welcome to PET!")
        expect(page).to have_content("Bugshooters")
    end

    it "Sign up is not successful" do
        visit "/signup"
        fill_in "Name", :with => "Bugshooters"
        click_button "Create User"
        expect(page).to have_content("The form contains 6 errors")
    end

    it "Sign up is not successful" do
        visit "/signup"
        fill_in "Name", :with => "Bugshooters"
        fill_in "Email", :with => "Bugshooters@cmu.edu"
        click_button "Create User"
        expect(page).to have_content("The form contains 4 errors")
    end

    it "Sign up is not successful" do
        visit "/signup"
        fill_in "Name", :with => "Bugshooters"
        fill_in "Email", :with => "Bugshooters@cmu.edu"
        fill_in "Password", :with => "12345678"
        click_button "Create User"
        expect(page).to have_content("The form contains 2 errors")
    end

    it "Sign up is not successful" do
        visit "/signup"
        fill_in "Name", :with => "Bugshooters"
        fill_in "Email", :with => "Bugshooters@cmu.edu"
        fill_in "Password", :with => "12345678"
        fill_in "Confirmation", :with => "1"
        click_button "Create User"
        expect(page).to have_content("The form contains 1 error")
    end
end
