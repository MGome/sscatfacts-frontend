# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Main', type: :request do
  context 'when request is GET main#home or root path' do
    it 'should respond ok status code' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
