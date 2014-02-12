require 'spec_helper'

describe "Home page" do

    before {
        visit "/"
    }

    it "Navigate to home page" do
        expect(page).to have_content("Start PET today!")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Welcome to PET")
    end

    it "Navigate to home page" do
        expect(page).to have_content("A Project Management Tool")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Home")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Help")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Sign in")
    end
end

describe "Home page" do

    before {
        visit "/"
        click_link "Home"
    }

    it "Navigate to home page" do
        expect(page).to have_content("Start PET today!")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Welcome to PET")
    end

    it "Navigate to home page" do
        expect(page).to have_content("A Project Management Tool")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Home")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Help")
    end

    it "Navigate to home page" do
        expect(page).to have_content("Sign in")
    end
end

describe "Help page" do

    before {
        visit "/"
        click_link "Help"
    }

    it "Navigate to help page" do
        expect(page).to have_content("PET help")
    end

    it "Navigate to help page" do
        expect(page).to have_content("This app is used for tracking and estimating projects.")
    end

    it "Navigate to help page" do
        expect(page).to have_content("The name of the app is \"Process Enactment Tool\".")
    end

    it "Navigate to help page" do
        expect(page).to have_content("We are yet to implement the choose lifecycle type logic.")
    end

    it "Navigate to help page" do
        expect(page).to have_content("Once the user creates a project")
    end

    it "Navigate to help page" do
        expect(page).to have_content("Here, the name, description and lifecycle of the project is displayed.")
    end

    it "Navigate to help page" do
        expect(page).to have_content("Home")
    end

    it "Navigate to help page" do
        expect(page).to have_content("Help")
    end

    it "Navigate to help page" do
        expect(page).to have_content("Sign in")
    end

end

describe "Contact page" do

    before {
        visit "/"
        click_link "Contact"
    }

    it "Navigate to contact page" do
        expect(page).to have_content("Bugshooters contact")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Jason Tao (jason.tao@sv.cmu.edu) ")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Ting Yu (ting.yu@sv.cmu.edu)")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Xiaolei Jin (xiaolei.jin@sv.cmu.edu) ")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Mrdula Chappalli Srinivasa (mridula.chappalli.srinivasa@sv.cmu.edu)")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Jacky Chen (jacky.chen@sv.cmu.edu)")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Home")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Help")
    end

    it "Navigate to contact page" do
        expect(page).to have_content("Sign in")
    end
end

