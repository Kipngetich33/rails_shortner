class Api::V1::UrlsController < ApplicationController
  def index
    '''
    Show all the Urls in the database
    '''
    urls = Url.all()
    return render json: urls, status: 200
  end

  def create
    '''
    Method that creates a new Url record
    '''    
    # generate unique code
    new_short_code = generate_unique_key()

    # check uniqueness of url
    @current_url = url_params[:http_url]
    unless check_if_url_is_unique()
      return render json: {error: "Url already exists in database."}
    end

    # create a new Url instance
    url = Url.new(
      http_url: url_params[:http_url],
      short_code: new_short_code
    ) 
    # now save the url
    if url.save()
      return render json: url , status: 200
    else
      return render json: {error: "Error occured while saving url."}
    end
  end

  def show
    '''
    Method that looks up a URL using its id and renders it else
    renders an error
    '''
    url = Url.find_by(short_code: params[:id])
    if url
      return render json: url, status: 200
    else 
      return render json: {error: "Url not found."}
    end
  end

  # def redirect
  #   '''
  #   Method that uses a given shortcode to get the original
  #   url
  #   '''
  #   puts("*"*80)
  #   puts("shorcode endpoint")
  #   short_code = params[:short_code]
  #   url = Url.find_by(short_code: short_code)
  #   if url
  #     return render json: {status: true, url: url.http_url}
  #   else
  #     return render json: {status: false, message: "Site not found."}
  #   end
  # end

  def generate_unique_key
    '''
    Method that generates a unique key to be used a s
    shortcode
    '''
    # generate a shortcode 6 character long
    generated_shortcode = SecureRandom.hex(3)
    # check that key is not already in database
    new_code = Url.find_by(short_code: generated_shortcode)
    if new_code
      # recursive call the function to create a new code
      generate_unique_key()
    else
      # return valid code
      return generated_shortcode
    end
  end

  def check_if_url_is_unique
    '''
    Method that checks whether the given url is unique
    or already exists in the database and returns appropriate 
    message
    '''
    url = Url.find_by(http_url: @current_url)
    if url
      return false
    else
      return true
    end
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
      ])
    end

end
