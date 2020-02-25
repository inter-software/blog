require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'GET #Index' do

    subject {get :index}

    it 'renders the index template' do

      expect(subject).to render_template('articles/index').

    end

  end

end
