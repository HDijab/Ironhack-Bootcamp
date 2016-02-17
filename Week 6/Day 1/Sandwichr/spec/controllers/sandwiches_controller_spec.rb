require 'rails_helper'

describe SandwichesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success code(200)' do
      get :index
      expect(response.code).to eq('200')
    end
  end

  describe 'GET #show' do
    it 'returns a success code(200)' do
      sandwich = Sandwich.create(name: 'test', bread_type: 'test')
      get :show, {id: sandwich.id}
      expect(response).to be_success
      sandwich.destroy
    end

    it 'returns not found' do
      get :show, {id: -1}
      expect(response).to be_not_found
    end
  end

  describe 'POST #create' do
    it 'creates a new Sandwich' do
      expect{
        post :create, {sandwich: {name: 'test', bread_type: 'test'}}
      }.to change(Sandwich, :count).by(1)
    end

    it 'raises an error when no wrapper' do
      expect{
        post :create, {name: 'test', bread_type: 'test'}
      }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe 'PUT #update' do
    it 'returns a success code(200)' do
      sandwich = Sandwich.create(name: 'test', bread_type: 'test')
      expect(
        put :update, id: sandwich.id, sandwich: {name: 'change', bread_type: 'change'}
      ).to be_success
      sandwich.destroy
    end
  end

  describe 'DELETE #delete' do
    it 'returns a success code(200)' do
      sandwich = Sandwich.create(name: 'test', bread_type: 'test')
      delete :destroy, {id: sandwich.id}
      expect(response).to be_success
    end
  end
end