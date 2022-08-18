class Api::V1::UrlsController < ApplicationController
  def index
    '''
    Show all the Urls in the database
    '''
    urls = Url.all()
    render json: urls, status: 200
  end

  def create
    '''
    Method that creates a new Url record
    '''
    url = Url.new(
      http_url: url_params[:http_url],
      short_code: url_params[:short_code]
    ) 
    # now save the url
    if url.save()
      render json: url , status: 200
    else
      render json: {error: "Error occured while saving url."}
    end
  end

  def show
    '''
    Method that looks up a URL using its id and renders it else
    renders an error
    '''
    url = Url.find_by(id: params[:id])
    if url
      render json: url, status: 200
    else 
      render json: {error: "Url not found."}
    end
  end

  def other
    render json: {status:true}
  end

  private
    '''
    Define private methods here to allow specific parameters to
    be passed to class
    '''
    
    def url_params
      '''
      define the specific model columns here
      '''
      params.require(:url).permit([
        :http_url, 
        :short_code
      ])
    end

end
