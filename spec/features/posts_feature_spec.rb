require 'rails_helper'

feature 'Posts' do
  include Helpers

  let!(:user){User.create(email: 'emily@example.com',
                          password: 'Pa55w0rd')}

  before do
    login(user)
  end

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/'
      expect(page).to have_content('No photos posted')
      expect(page).to have_link('Post a photo')
    end
  end

  context 'creating posts' do
    scenario 'should allow user to add a post' do
      visit '/'
      click_link 'Post a photo'
      fill_in 'Add a caption', with: 'cool'
      click_button 'Post'
      expect(page).to have_content('cool')
    end

    scenario 'should not let user add a post if not signed in' do
      visit '/'
      click_link 'Sign Out'
      expect(page).to have_content('Please sign in to post a photo')
    end
  end

  context 'posts have been added' do
    let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'), description: 'cool')}

    context 'on home page' do
      scenario 'display posts' do
        visit '/'
        expect(page).to have_content('cool')
        expect(page).not_to have_content('No photos posted')
      end
    end

    context 'when photo is clicked' do

      scenario 'user signed in' do
        visit '/posts'
        click_link "#{post.id}"
        expect(page).to have_link('Add comment')
      end

      scenario 'user is not signed in' do
        visit '/posts'
        click_link 'Sign Out'
        click_link "#{post.id}"
        expect(page).not_to have_link('Add comment')
        expect(page).to have_content('Sign in to add a comment')
      end
    end
  end

  # context 'deleting posts' do
  #   scenario 'removes a post when a user clicks delete post' do
  #     add_post
  #     click_link 'Delete post'
  #     expect(page).not_to have_content('#testing')
  #     expect(page).to have_content('Post deleted successfully')
  #   end
  # end
end
