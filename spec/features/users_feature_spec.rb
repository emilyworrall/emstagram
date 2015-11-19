require 'rails_helper'

feature 'Users' do
  context 'not signed in and on the homepage' do
    it "should see a 'Login' link and a 'Sign Up' link" do
      visit '/'
      expect(page).to have_link('Login')
      expect(page).to have_link('Sign Up')
    end
  end

  context 'signed in and on the homepage' do
  
  end
end
