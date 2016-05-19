require_relative '../spec_helper'


describe 'Home page' do

  it 'should say Home Page' do
    visit '/'
    expect(page).to have_content('Home Page')
  end

end

