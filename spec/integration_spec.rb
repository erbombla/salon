require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adds a new hair stylist to database', {:type => :feature}) do
  it('allows a user to click a stylist to see the stylist name') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('First Name', :with =>'Harvey')
    click_button('Submit')
    expect(page).to have_content('Stylist Successfully Saved')
  end
end

describe('views all stylists in the database', {:type => :feature}) do
  it('views all hair stylists saved to database') do
    stylist = Stylist.new({first_name: 'Harvey', last_name: 'Dent', id: nil})
    stylist.save()
    visit('/')
    click_link('View Stylists')
    expect(page).to have_content(stylist.first_name)
  end
end
