class Api::V1::UrlsController < ApplicationController
  def index
    '''
    Show all the Urls in the database
    '''
    puts("*"*80)
    puts("fetching records")
    urls = Url.all()
    render json: urls, status: 200
  end

  def create
    '''
    Method that creates a new Url record
    '''
    puts("*"*80)
    puts("creating object")
    url = Url.new(
      httpurl: url_params[:httpurl],
      short_id: url_params[:short_id]
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
        :httpurl, 
        :short_id
      ])
    end
    
end
