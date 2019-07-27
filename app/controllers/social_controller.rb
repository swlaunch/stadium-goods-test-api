require('rest-client')

class SocialController < ActionController::API
  def get_posts

    begin 
      twitter_response = RestClient.get('https://takehome.io/twitter')
    rescue RestClient::ExceptionWithResponse => err
      puts err
      twitter_response = "[]"
    end

    begin 
      facebook_response = RestClient.get('https://takehome.io/facebook')
    rescue RestClient::ExceptionWithResponse => err
      puts err
      facebook_response = "[]"
    end

    begin 
      instagram_response = RestClient.get('https://takehome.io/instagram')
    rescue RestClient::ExceptionWithResponse => err
      puts err
      instagram_response = "[]"
    end
    
    render status: :ok, json: {
        twitter: JSON.parse(twitter_response),
        facebook: JSON.parse(facebook_response),
        instagram: JSON.parse(instagram_response),
    }
  end
end
