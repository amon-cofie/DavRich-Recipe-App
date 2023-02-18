require 'rails_helper'

RSpec.describe PublicRecipesController, type: :request do
  describe 'public recipes controller' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
      get public_recipes_path
    end

    it 'render index action' do
      expect(response).to render_template(:index)
    end

    it 'return status code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'return index view text' do
      expect(response.body).to include('Public Recipe')
    end
  end
end
