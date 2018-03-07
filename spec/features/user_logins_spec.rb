require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do

    @user = User.create!(
      first_name: 'Dercilio',
      last_name: 'Fontes',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )

  end
  
  scenario "A user can login and go to home page" do

    # ACT
    visit new_session_path

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end

    # DEBUG / VERIFY
    save_screenshot 'jungle.png'

    expect(page).to have_content 'Signed in as Dercilio Fontes'
  end

end
