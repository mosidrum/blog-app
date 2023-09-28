require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a 200 OK status' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index.html.erb template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'renders the index page with html elements' do
      get '/users'
      expect(response.body).to include('<div class="container">')
      expect(response.body).to include('<h1>Username</h1>')
      expect(response.body).to include('<p>Number of posts x</p>')
      expect(response.body).to include('<img src="example.com" alt="image">')
    end

    it 'renders text on the index page' do
      get '/users'
      expect(response.body).to include('Username')
      expect(response.body).to include('Number of posts x')
      expect(response.body).to include('Number of posts x')
    end
  end

  describe 'Get a user with an id' do
    it 'returns OK a status code of 200' do
      get '/users/732'
      expect(response).to have_http_status(200)
    end

    it 'renders expected html elements' do
      get '/users/732'
      expect(response.body).to include('<h1>Username</h1>')
      expect(response.body).to include('<p>Number of posts x</p>')
      expect(response.body).to include('<img src="example.com" alt="image">')
    end

    it 'contains the user ID in the URL' do
      get '/users/732'
      expect(request.fullpath).to include('/users/732')
    end

    it 'renders the show.html.erb template' do
      get '/users/732'
      expect(response).to render_template(:show)
    end
  end
end
