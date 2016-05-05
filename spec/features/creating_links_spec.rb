require 'spec_helper'

feature 'Submitting new link' do

  scenario 'adds new link to links page when submitted' do
    visit('/links/new')
    fill_in('link_title', with: 'Youtube')
    fill_in('link_url', with: 'http://youtube.com')
    fill_in('link_tags', with: 'social')
    
    click_button('Add')
    
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end
end