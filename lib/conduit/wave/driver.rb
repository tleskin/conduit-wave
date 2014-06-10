module Conduit
  module Driver
    # Conduit Driver for the BeQuick Wave Api
    module Wave
      extend Conduit::Core::Driver

      required_credentials :token

      action :create_message_template
      action :list_message_templates
      action :list_profiles
      action :send_message
      action :update_message_template
    end
  end
end
