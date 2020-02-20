# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /comments' do
    it 'creates a Comment and redirects to the Comments page' do
      get '/comments/new'
      expect(response).to have_http_status(:ok)

      post '/comments', comment: { commenter: 'My Commenter', body: 'My Body' }
      expect(response).to have_http_status(302)

      follow_redirect!

      expect(response).to have_http_status(:success)
    end
  end
end
