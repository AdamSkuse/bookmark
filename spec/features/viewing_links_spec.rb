require 'spec_helper'

feature 'Viewing Links' do

  scenario 'should show a link when visiting homepage' do
    Link.create(url: 'http://google.com', title: 'Google')
    visit('/links')
    within('ul#links') do
    	expect(page).to have_content('Google')
    end
  end

  scenario 'should show links filtered by tag' do
    Link.create(url: 'http://google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://yahoo.com', title: 'Yahoo', tags: [Tag.first_or_create(name: 'search')])
    visit('/tags/search')
    within('ul#links') do
      expect(page).to have_content('Google')
      expect(page).to have_content('Yahoo')
    end
  end
end
