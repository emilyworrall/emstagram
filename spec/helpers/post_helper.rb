module Helpers
  def login(user)
    visit('/')
    click_link('Login')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end

  def add_post
    visit '/'
    click_link 'Post a photo'
    fill_in 'Add a caption', with: '#testing'
    page.attach_file(image, Rails.root + 'spec/fixtures/images/example.png')
    click_button 'Post'
  end
end
