require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  describe 'food controller' do
    context 'index action' do
      it 'render index action' do
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
        get '/recipes/'
        expect(response).to render_template(:index)
      end

      it 'return status code ok' do
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
        get '/recipes/'
        expect(response).to have_http_status(:ok)
      end

      it 'return index view text' do
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
        get '/recipes/'
        expect(response.body).to include('Recipes Index')
      end
    end
  end
end
