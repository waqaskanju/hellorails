# including the library
require 'rails_helper'

# Test 1
# It is for Post Controller
RSpec.describe PostsController, type: :controller do
  controller do
    # checking index method
    def index
      # it should be status OK
      render json: {}, status: 200
    end
  end

  # Test 2
  describe 'Check for customn status' do
    it 'Returns a 200 custom status code' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end

# Test 3
RSpec.describe 'Go to user 2 post', type: :request do
  it 'Go to post 2' do
    get '/users/2/posts'
    expect(response).to render_template(:index)
  end

  # Test 4
  it 'Got to a specific user and post' do
    get '/users/3/posts/2'
    # go to show method
    expect(response).to render_template(:show)
  end

  # Test 5
  describe 'List all posts' do
    it 'show posts' do
      get '/users/4/posts'
      expect(response.body).to include('Ahmad')
    end
  end

  describe 'Go to 5 user and its first post' do
    it 'Has a post related heading' do
      get '/users/5/posts/1'
      expect(response.body).to include('Khan')
    end
  end
end
