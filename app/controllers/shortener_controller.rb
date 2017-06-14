class ShortenerController < ApplicationController
  def index
    @url = Url.new
    render "shortener/index"
  end
end
