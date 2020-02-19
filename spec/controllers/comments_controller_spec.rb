require 'rails_helper'

RSpec.describe CommentsController, type: :controller do


    context 'GET #index' do
        it 'returns a success response' do
            get :index
            expenct(response).to render_template(:index)# wraps assert_template
        end
    end

    context 'GET #show' do
        it 'returns a success response' do
            commemt = Comment.create!(commenter: 'Juan', body: 'Great Cool!!')
            get :show, params: {id: commemt.to.param }
            expenct(response).to be_success #response.success?
            
        end
    end

end
