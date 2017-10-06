class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  # GET /conversations
  def index
    @conversations = Conversation.all
    json_response(@conversations)
  end

  # POST /conversations
  def create
    @conversation = Conversation.create!(conversation_params)
    json_response(@conversation, :created)
  end

  # GET /conversations/:id
  def show
    json_response(@conversation)
  end

  # PUT /conversations/:id
  def update
    @conversation.update(conversation_params)
    head :no_content
  end

  # DELETE /conversations/:id
  def destroy
    @conversation.destroy
    head :no_content
  end

  private

  def conversation_params
    # whitelist params
    params.permit(:sender_id, :recipient_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end