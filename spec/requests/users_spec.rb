# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'when request is GET users#new' do
    it 'should respond ok status code' do
      get new_user_path
      expect(response).to have_http_status(:ok)
    end
  end
end
