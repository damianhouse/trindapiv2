require 'rails_helper'

RSpec.describe 'Conversations API', type: :request do
  # initialize test data 
  let!(:conversation) { create(:conversation) }
  let!(:sender) { create(:user) }
  let!(:recipient) { create(:user) }
  let(:conversation_id) { conversation.id }
  
  # Test suite for GET /conversations
  describe 'GET /conversations' do
    # make HTTP get request before each example
    before { get '/conversations' }

    it 'returns conversations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /conversations/:id
  describe 'GET /conversations/:id' do
    before { get "/conversations/#{conversation_id}" }

    context 'when the record exists' do
      it 'returns the conversation' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(conversation_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:conversation_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Conversation/)
      end
    end
  end

  # Test suite for POST /conversations
  describe 'POST /conversations' do
    # valid payload
    let(:valid_attributes) { { sender_id: sender.id, recipient_id: recipient.id } }
    
    context 'when the request is valid' do
      before { post '/conversations', params: valid_attributes }

      it 'creates a conversation' do
        expect(json['sender_id']).to eq(sender.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/conversations', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Sender must exist, Recipient must exist, Sender can't be blank, Recipient can't be blank/)
      end
    end
  end

  # Test suite for PUT /conversations/:id
  describe 'PUT /conversations/:id' do
    let(:valid_attributes) { { sender_id: recipient.id, recipient_id: sender.id } }

    context 'when the record exists' do
      before { put "/conversations/#{conversation_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /conversations/:id
  describe 'DELETE /conversations/:id' do
    before { delete "/conversations/#{conversation_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end