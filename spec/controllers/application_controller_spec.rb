# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      # Checking a numeric status code, :status => #
      # Checking a symbol variable in status code, :status => :see_other
      render json: {}, status: :see_other
    end

    describe 'GET #index' do
      it 'returns a 404 cutom status code' do
        get :index
        # Here pass method expect una response, get status in http with parameter un symbol
        expect(response).to have_http_satus(:see_other)
      end
    end
  end
end
