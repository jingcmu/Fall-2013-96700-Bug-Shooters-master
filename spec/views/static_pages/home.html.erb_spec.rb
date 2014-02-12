require 'spec_helper'

describe 'static_pages/home.html.erb' do

  it 'should contain Start PET today! in home page' do
    render
    rendered.should contain('Start PET today!')
  end

  it 'should contain Welcome to PET in home page' do
    render
    rendered.should contain('Welcome to PET')
  end

  it 'should contain A Project Management Tool in home page' do
    render
    rendered.should contain('A Project Management Tool')
  end

  it 'should contain sign up now in home page' do
    render
    rendered.should contain('Sign Up Now')
  end

end