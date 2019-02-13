class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :delete]
  before_action :require_user,only: [:show,:index]

  # GET /messages
  # GET /messages.json
  def index

    @message = Message.paginate(page: params[:page], per_page: 10)
    @cars = @message.group_by { |r| r.created_at.to_date }
  end

  # GET /messages/1
  # GET /messages/1.json
  def show

  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        @x=1
        @msg = "Message Received, we will try to get back to you soon"
        format.html { redirect_to "#message"}
      elsif(@message.errors.any?)
        @x=1
        flash[:Danger] = "Invalid Message"
        @msg=[]
        @count=@message.errors.count
        @msg=@message.errors.full_messages.split(' ')
        format.html { render :new }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def delete
    @message=Message.find(params[:id])
    @message.destroy

    flash[:danger] = "Message Deleted"
    redirect_to messages_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :email, :phone, :message)
    end
end
