class PagesController < MessagesController
  def home

  end

  def new
    @messages = Message.new
  end

  def create
    @x=1
    flash[:x] = "Hiiii"
  end

end
