class UrlsController < ApplicationController
  before_action :find_url, only: [:show, :shortened]

  def index
    @urls = Url.all
  end

  def show
    if @url
      redirect_to @url.sanitized_url
    else
      @url = Url.new
      flash[:error] = "Unable to redirect to a URL. Did you get here by mistake?"
      render 'shortener/index'
    end
  end

  def create
    @url = Url.new(url_params)
    @url.sanitize
    if current_user
      @url.user = current_user
    end
    if @url.new_url?
      if @url.save
        redirect_to shortened_path(@url.short_url)
      else
        flash[:error] = "Check the error below:"
        render 'shortener/index'
      end
    else
      flash[:notice] = "This URL has already been shortened"
      redirect_to shortened_path(@url.find_duplicate.short_url)
    end
  end

  def shortened
    render 'urls/show'
  end

  private

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
