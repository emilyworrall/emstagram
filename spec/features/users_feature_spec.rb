require 'rails_helper'

feature 'Users' do
  include Helpers

  context 'not signed in and on the homepage' do
    it "should see a 'Login' link and a 'Sign Up' link" do
      visit '/'
      expect(page).to have_link('Login')
      expect(page).to have_link('Sign Up')
    end
  end

  context 'signed in and on the homepage' do
    let!(:user){User.create(email: 'emily@example.com',
                            password: 'Pa55w0rd')}

    before do
      login(user)
    end

    it 'should see "Sign Out" link' do
      visit '/'
      expect(page).to have_link('Sign Out')
    end

    it 'should not see a "Login" link and a "Sign Up" link' do
      visit '/'
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Sign Up')
    end
  end
end
