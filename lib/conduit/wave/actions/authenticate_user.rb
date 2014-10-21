require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  class AuthenticateUser < Conduit::Driver::Wave::Base
    url_route           '/users/sessions.json'
    required_attributes :email, :password
    http_method         :post

    # Remove the standard credentials that are automatically
    # included by the Wave::Base action
    #
    Conduit::Driver::Wave.credentials.each do |item|
      self.requirements.delete item
      self.attributes.delete item
    end
  end
end
