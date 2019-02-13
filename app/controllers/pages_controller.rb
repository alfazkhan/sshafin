class PagesController < MessagesController
  def home

  end

  def new
    @messages = Message.new
  end

end
