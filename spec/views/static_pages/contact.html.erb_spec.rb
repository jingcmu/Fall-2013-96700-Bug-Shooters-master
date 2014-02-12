require 'spec_helper'

describe 'static_pages/contact.html.erb' do

  it 'should have Bugshooters contact in contact page' do
    render
    rendered.should contain('Bugshooters contact')
  end

  it 'should contain Jason Tao (jason.tao@sv.cmu.edu) in contact page' do
    render
    rendered.should contain('Jason Tao (jason.tao@sv.cmu.edu)')
  end

  it 'should contain Ting Yu (ting.yu@sv.cmu.edu) in contact page' do
    render
    rendered.should contain('Ting Yu (ting.yu@sv.cmu.edu)')
  end

  it 'should contain Xiaolei Jin (xiaolei.jin@sv.cmu.edu) in contact page' do
    render
    rendered.should contain('Xiaolei Jin (xiaolei.jin@sv.cmu.edu)')
  end

  it 'should contain Mrdula Chappalli Srinivasa (mridula.chappalli.srinivasa@sv.cmu.edu) in contact page' do
    render
    rendered.should contain('Mrdula Chappalli Srinivasa (mridula.chappalli.srinivasa@sv.cmu.edu)')
  end

  it 'should contain Jacky Chen (jacky.chen@sv.cmu.edu) in contact page' do
    render
    rendered.should contain('Jacky Chen (jacky.chen@sv.cmu.edu)')
  end

end