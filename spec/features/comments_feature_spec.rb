require 'rails_helper'

feature 'Comments' do
  include Helpers

  let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'),
                          description: 'cool')}
  let!(:user){User.create(username: 'example1',
                          email: 'emily@example.com',
                          password: 'Pa55w0rd')}

  before do
    login(user)
  end

  context 'when user logged in' do
    scenario 'allows users to leave a comment on a post using a form' do
      visit '/'
      click_link "#{post.id}"
      click_link 'Add comment'
      fill_in 'Add a comment..', with: 'lovely'
      click_button 'Post'
      expect(current_path).to eq "/posts/#{post.id}"
      expect(page).to have_content('@example1 lovely')
    end
  end
end
