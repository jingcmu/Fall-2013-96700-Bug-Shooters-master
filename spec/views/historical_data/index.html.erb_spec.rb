require 'spec_helper'

describe "historical data page" do

   it "should have content small" do
    visit '/historical_data/index'
    page.should have_content('Small')
  end

   it "should have content average" do
     visit '/historical_data/index'
     page.should have_content('Average')
   end

   it "should have content large" do
     visit '/historical_data/index'
     page.should have_content('Large')
   end

   it "should have content low" do
     visit '/historical_data/index'
     page.should have_content('Low')
   end

   it "should have content medium" do
     visit '/historical_data/index'
     page.should have_content('Medium')
   end

   it "should have content high" do
     visit '/historical_data/index'
     page.should have_content('High')
   end



  end
