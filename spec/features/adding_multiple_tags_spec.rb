require 'spec_helper'

feature 'Adding multiple tags' do

  scenario 'user can add multiple tags to a new link' do
    visit('/links/new')
    fill_in('link_title', with: 'SOLID')
    fill_in('link_url', with: 'http://www.codemag.com/article/1001061')
    fill_in('link_tags', with: 'education programming')
    
    click_button('Add')
    
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'programming')
  end
end
