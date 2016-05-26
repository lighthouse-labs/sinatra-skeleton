require_relative '../spec_helper'


# Make sure your specs are tagged with type: :feature if you
# want to use capybara methods (visit, fill_in, click_link, have_content, etc)

describe 'Home page', type: :feature do

  before { visit '/' }

  it 'should contain the text "Home Page"' do
    expect(page).to have_content('Home Page')
  end

end

