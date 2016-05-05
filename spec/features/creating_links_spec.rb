require 'spec_helper'

feature 'Submitting new link' do

  scenario 'adds new link to links page when submitted' do
    visit('/links/new')
    fill_in('link_title', with: 'Facebook')
    fill_in('link_url', with: 'http://facebook.com')
    fill_in('link_tags', with: 'social')
    click_button('Add')
    link = Link.first 
    expect(link.tags.map(&:name)).to include('social')
    # expect(current_path).to eq '/links'
    # within('ul#links') do
    # 	expect(page).to have_content('Facebook')
  end


end
