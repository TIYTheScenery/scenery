require 'httparty'

module Omniauth
  class Facebook
    include HTTParty

    # The base uri for facebook graph API
    base_uri 'https://graph.facebook.com/v2.3'

    # Used to authenticate app with facebook user
    # Usage
    #   Omniauth::Facebook.authenticate('authorization_code')
    # Flow
    #   Retrieve access_token from authorization_code
    #   Retrieve User_Info hash from access_token
    def self.authenticate(code)
      provider = self.new
      access_token = provider.get_access_token(code)
      user_info    = provider.get_user_profile(access_token)
      return user_info, access_token
    end

    # Used to revoke the application permissions and login if a user
    # revoked some of the mandatory permissions required by the application
    # like the email
    # Usage
    #    Omniauth::Facebook.deauthorize(access_token)
    # Flow
    #   Send DELETE /me/permissions?access_token=XXX
    def self.deauthorize(access_token)
      options  = { query: { access_token: access_token } }
      response = self.delete('/me/permissions', options)

      # Something went wrong most propably beacuse of the connection.
      unless response.success?
        Rails.logger.error 'Omniauth::Facebook.deauthorize Failed'
        fail Omniauth::ResponseError, 'errors.auth.facebook.deauthorization'
      end
      response.parsed_response
    end

    def get_access_token(code)
      response = self.class.get('/oauth/access_token', query(code))

      Rails.logger.debug response
      # Something went wrong either wrong configuration or connection
      unless response.success?
        Rails.logger.error 'Omniauth::Facebook.get_access_token Failed'
        fail Omniauth::ResponseError, 'errors.auth.facebook.access_token'
      end
      response.parsed_response['access_token']
    end

    def get_user_profile(access_token)
      options = { query: { access_token: access_token } }
      response = self.class.get('/me', options)

      # Something went wrong most propably beacuse of the connection.
      unless response.success?
        Rails.logger.error 'Omniauth::Facebook.get_user_profile Failed'
        fail Omniauth::ResponseError, 'errors.auth.facebook.user_profile'
      end
      response.parsed_response
    end


    private

    # access_token required params
    # https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow/v2.3#confirm
    def query(code)
      {
        query: {
          # The authorization_code we want to exchange for the access_token
          code: code,
          # This must match the redirectUrl registerd in the facebook app.
          # You can save it to ENV['WEB_APP_URL'] if you have multiple facebook apps for development and testing
          # so you can support testing app on development and production app on production env.
          redirect_uri: "https://api.the-scenery.com/",
          client_id: ENV['FACEBOOK_APP_ID'], # Facebook appId
          client_secret: ENV['FACEBOOK_SECRET'], # Facebook app secret (must not exist on front-end app for security)
        }
      }
    end
  end
end
