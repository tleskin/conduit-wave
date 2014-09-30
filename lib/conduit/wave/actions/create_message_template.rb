require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class CreateMessageTemplate < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/message_templates"

    required_attributes *Conduit::Driver::Wave.credentials,
      :profile_id, :body, :sender, :delivery_mechanism

    optional_attributes :name, :subject, :email_format
  end
end
