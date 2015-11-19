require 'rails_helper'

feature 'posts' do
  context 'no photos have been posted' do
    scenario 'should display a prompt to add a photo' do
      visit '/posts'
      expect(page).to have_content 'No photos posted'
      expect(page).to have_content 'Post a photo'
    end
  end
end
