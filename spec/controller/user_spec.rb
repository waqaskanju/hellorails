# include library
require 'rails_helper'

# test for User Controller
RSpec.describe UsersController, type: :controller do
  controller do
    # check the index method
    def index
      render json: {}, status: 200
    end
  end

  # Test 1
  # Check if index is ok
  describe 'Index status' do
    it 'Returns a 200 custom status code' do
      get :index
      # expect the result ot be ok
      expect(response).to have_http_status(200)
    end
  end
end

# Test 2
RSpec.describe 'show all users', type: :request do
  it 'list users' do
    get '/users'
    # go to index page
    expect(response).to render_template(:index)
  end

  # Test 3
  # show user 1
  it 'Go to user 1' do
    get '/users/1'
    # rediect to show method
    expect(response).to render_template(:show)
  end

  # Test 4
  describe 'Show all user' do
    it 'do it have heading' do
      get '/users'
      expect(response.body).to include('Waqas')
    end
  end

  # Test 5

  describe 'Go to user 3' do
    it 'Vist user 3' do
      get '/users/3'
      expect(response.body).to include('Bio')
    end
  end
end
