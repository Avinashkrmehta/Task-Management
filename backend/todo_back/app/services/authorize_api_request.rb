class AuthorizeApiRequest
    def initialize(headers = {})
      @headers = headers
    end
  
    def call
      user
    end
  
    private
  
    attr_reader :headers
  
    def user
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    rescue ActiveRecord::RecordNotFound
      nil
    end
  
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebTokenService.decode(http_auth_header)
    end
  
    def http_auth_header
      if headers['Authorization'].present?
        headers['Authorization'].split(' ').last
      end
    end
  end
  