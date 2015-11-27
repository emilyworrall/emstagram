require 'rails_helper'

feature 'liking posts' do
  include Helpers

  let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'),
                          description: 'cool')}
  let!(:user){User.create(username: 'example1',
                          email: 'emily@example.com',
                          password: 'Pa55w0rd')}

  before do
    login(user)
  end

  scenario 'a user can like a post, which updates the post like count', js: true do
    visit '/posts'
    click_link('likes-link')
    expect(page).to have_content('1 like')
  end

end
