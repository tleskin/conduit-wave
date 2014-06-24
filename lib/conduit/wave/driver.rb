module Conduit
  module Driver
    # Conduit Driver for the BeQuick Wave Api
    module Wave
      extend Conduit::Core::Driver

      required_credentials :token

      action :create_message_template
      action :message_template_list
      action :profile_list
      action :send_message
      action :update_message_template
    end
  end
end
