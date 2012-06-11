# require 'spec_helper'

# describe "Static pages" do

#   subject { page }

#   describe "Home page" do
#     before { visit root_path }

#     it { should have_selector('h1',    text: 'Sample App') }
#     it { should have_selector('title', text: full_title('')) }
#     it { should_not have_selector 'title', text: '| Home' }
#   end

#   describe "Help page" do
#     before { visit help_path }

#     it { should have_selector('h1',    text: 'Help') }
#     it { should have_selector('title', text: full_title('Help')) }
#   end

#   describe "About page" do
#     before { visit about_path }

#     it { should have_selector('h1',    text: 'About') }
#     it { should have_selector('title', text: full_title('About Us')) }
#   end

#   describe "Contact page" do
#     before { visit contact_path }

#     it { should have_selector('h1',    text: 'Contact') }
#     it { should have_selector('title', text: full_title('Contact')) }
#   end
# end
# ####################

require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)     { 'Help' } 
    let(:page_title)  { 'Help' }
    # lets are only put into play if they are used

    it_should_behave_like "all static pages"
    # this runs the test suite of 2 tests
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     { 'About' }
    let(:page_title)  { 'About Us' }

    it_should_behave_like "all static pages"
    # this runs the test suite of 2 tests
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)     { 'Contact' }
    let(:page_title)  { 'Contact' }

    it_should_behave_like "all static pages"
    # this runs the test suite of 2 tests
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    # How does it know which link to click? [generates a CSS binder] and we visit them in order
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
    page.should_not have_selector 'title', text: full_title('| Home')
  end
end