class PagesController < MessagesController
  def home

  end

  def new
    @message = Message.new
  end

end
