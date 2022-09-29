# Link Library
require 'rails_helper'

# Create data
RSpec.describe 'Testing For User index page', type: :system do
  before(:each) do
  @user1 =  User.create(name: 'Robb Stark', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/5/50/S3E9_Robb_Stark_main.jpg/revision/latest?cb=20160718071203',
      bio: 'We will take revenge..')
  
  @user2 =  User.create(name: 'Jon Snow', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/d/d0/JonSnow8x06.PNG/revision/latest?cb=20190714094440',
      bio: 'I place mushrooms everywhere')
  
  @user3 = User.create(name: 'Sansa Stark', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/6/63/QueenSansa.PNG/revision/latest?cb=20210215100224',
      bio: 'The north is ours')
  
  @user4 = User.create(name: 'Arya Stark', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/b/be/AryaShipIronThrone.PNG/revision/latest?cb=20190520174300',
          bio: 'I am No One. I have many faces.')
  end

  # Testing Names of Users
  scenario 'Test Name of users.' do
    visit '/users'

    # Test 1.
    expect(page).to have_content('Aray Stark')

    # Test 2.
    expect(page).to have_content('Jon Snow')

    # Test 3.
    expect(page).to have_content('Robb Stark')

     # Test 4.
     expect(page).to have_content('Sansa Stark')
  end

  scenario 'Test Pictures of users.' do
    visit '/users'

    # Test 1
    expect(page).to have_xpath("//img[@src='#{@user1.photo}']")
    
    # Test 2
    expect(page).to have_xpath("//img[@src='#{@user2.photo}']")
    
    # Test 3
    expect(page).to have_xpath("//img[@src='#{@user3.photo}']")
    
    # Test 4
    expect(page).to have_xpath("//img[@src='#{@user4.photo}']")
  end

  scenario 'Test Number of Posts.' do
    visit '/users'
    # Test 1
    expect(page).to have_content("Posts: #{@user1.PostsCounter}")
    
    # Test 2
    expect(page).to have_content("Posts: #{@user2.PostsCounter}")
    
    # Test 3
    expect(page).to have_content("Posts: #{@user3.PostsCounter}")

    # Test 4
    expect(page).to have_content("Posts: #{@user4.PostsCounter}")
  end

  scenario 'Test Links.' do
    
    # Test 1
    visit '/users'
    click_link @user1.name
    expect(page).to have_current_path(user_path(@user1))
    
    # Test 2
    visit '/users'
    click_link @user2.name
    expect(page).to have_current_path(user_path(@user2))
    
    # Test 3
    visit '/users'
    click_link @user3.name
    expect(page).to have_current_path(user_path(@user3))

    # Test 4
    visit '/users'
    click_link @user4.name
    expect(page).to have_current_path(user_path(@user4))
  end
end