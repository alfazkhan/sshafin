class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create,:new]
  before_action :require_user,only: [:show,:index]

  def index
    @message = Message.paginate(page: params[:page], per_page: 10)
    @cars = @message.group_by { |r| r.created_at.to_date }
  end

  def show

  end


  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
        if @message.save
          @x=1
          @msg = "Message Received, we will try to get back to you soon"
          render 'sent'
        elsif(@message.errors.any?)
          @x=1
          flash[:Danger] = "Invalid Message"
          @msg=[]
          @count=@message.errors.count
          @msg=@message.errors.full_messages.split(' ')
          render 'new'
        else
          render 'new'

        end
  end



  def sent

  end


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


  def delete
    @message=Message.find(params[:id])
    if @message.destroy
      flash[:danger] = "Message Deleted"
      redirect_to messages_path
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:name, :email, :phone, :message)
    end

end