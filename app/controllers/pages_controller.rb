class PagesController < MessagesController
  def home

  end

  def new
    @messages = Message.new
  end

  def create
    flash[:x] = "Hiiii"
  end

end
