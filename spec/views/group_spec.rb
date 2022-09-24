require 'rails_helper'

RSpec.describe 'groups/index', type: :system do
  before :each do
    @user = User.create!(name: 'Chris', email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
  end
  it 'should sign_in the user' do
    visit user_session_path
    fill_in 'user[email]', with: 'test@dmail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end
  it 'should add a new group' do
    @group = Group.create!(name: 'Test group', icon: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM[…]90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80', user_id: @user.id)
    visit user_session_path
    fill_in 'user[email]', with: 'test@gmail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('TEST GROUP')
  end
end
