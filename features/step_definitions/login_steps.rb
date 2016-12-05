Given(/^My role is Admin$/) do
  @role_admin = FactoryGirl.create :officer_role_admin
end

Given(/^I am a admin$/) do
  @user_admin = FactoryGirl.create :admin
end

When(/^I visit the Homepage of the Accommodation System$/) do
  visit '/'
end

Then(/^I should see a link for sign in$/) do
  expect(page).to have_link('Sign in', href: '/users/sign_in')
end

When(/^I click the link for sign in$/) do
  visit '/users/sign_in'
end

Then(/^I see a form to fill in my account$/) do
  expect(page).to have_selector('form#new_user')
end

When(/^I submit the form$/) do
  fill_in 'Email', with: @user_admin.email
  fill_in 'Password', with: @user_admin.password
  click_button 'Log in'
end

Then(/^I am redirected to the start page$/) do
  visit '/'
end

Then(/^I should see my signed in and a link to sign out$/) do
  # save_and_open_page
  expect(page).to have_content "#{@user_admin.email}"
  expect(page).to have_link('Sign out', href: destroy_user_session_path)
end

################################################################################

Given(/^I am a user$/) do
  @no_role = FactoryGirl.create :officer_no_role
end

Given(/^I want to register account$/) do
  @user_staff = FactoryGirl.build :staff
end

# When(/^I visit the Homepage of the Accommodation System$/) do
#   visit '/'
# end

Then(/^I should see a link for sign up$/) do
  expect(page).to have_link('Sign up', href: '/users/sign_up')
end

When(/^I click the link for sign up$/) do
  visit '/users/sign_up'
end

Then(/^I see a form to fill in my registration detail$/) do
  expect(page).to have_selector('form#new_user')
end

When(/^I submit the registration form$/) do
  fill_in 'Email', with: @user_staff.email
  fill_in 'Password', with: @user_staff.password
  fill_in 'Password confirmation', with: @user_staff.password_confirmation
  click_button 'Sign up'
end

# Then(/^I am redirected to the start page$/) do
#   visit '/'
# end

Then(/^I should see my signed in with my role$/) do
  # save_and_open_page
  expect(page).to have_content "#{@user_staff.email}"
  expect(page).to have_content "#{@no_role.role}"
end

################################################################

When(/^I want to sign in$/) do
  visit '/users/sign_in'
end

Then(/^I see a form to fill in$/) do
  expect(page).to have_selector('form#new_user')
end

When(/^I sign in$/) do
  fill_in 'Email', with: @user_admin.email
  fill_in 'Password', with: @user_admin.password
  click_button 'Log in'
end

Then(/^I should see a link of registered users$/) do
  expect(page).to have_link('Statistics', href: administration_statistics_path)
end

When(/^I click the link of registered users$/) do
  visit administration_userlist_path
end

Then(/^I should see all users$/) do
  expect(page).to have_content "#{@user_admin.email}"
end

Given(/^I have a staff user$/) do
  @user_staff = FactoryGirl.create :staff
end

When(/^I click the link for ban$/) do
  visit administration_banuser_path+'?which_user='+"#{@user_staff.id}"
end

Then(/^I should see a status of user is non\-active$/) do
  expect(page).to have_content "non-active"
end

##################################################################

When(/^I want to see statistics page$/) do
  visit '/'
end

Then(/^I should see a link of statistics page$/) do
  expect(page).to have_link('Statistics', href: administration_statistics_path)
end

When(/^I click the link of statistics page$/) do
  find_link('Statistics', href: administration_statistics_path).click
end

Then(/^I should see about statistic of user registration$/) do
  expect(page).to have_content "All User"
  expect(page).to have_content "All Role"
  # expect(page).to have_content "Total of Admins"
  # expect(page).to have_content "Total of Supervisors"
  # expect(page).to have_content "Total of Staffs"
  # expect(page).to have_content "Total of NoRole"
  # save_and_open_page
end
