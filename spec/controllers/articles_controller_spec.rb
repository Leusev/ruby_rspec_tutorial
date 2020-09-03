# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe ArticlesController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    let!(:article) { Article.create(title: 'Test title', body: 'Test body') }
    # login_user
    it 'returns a success response' do
      get :show, params: { id: article }
      expect(response).to be_successful
    end
  end

  context 'POST #create' do
    # login_user
    it 'creates an Article and returns a success response' do
      byebug
      expect(Article.count).to eq(0)
      post :create, params: { title: 'Test title', body: 'Test body' }
      expect(Article.count).to eq(1)
    end
  end

  context 'DELETE #destroy' do
    # login_user
    let!(:article) { Article.create(title: 'Test title', body: 'Test body') }
    it 'deletes an Article and returns a success response' do
      expect(Article.count).to eq(1)
      delete :destroy, params: { id: article }
      expect(Article.count).to eq(0)
    end
  end
end
