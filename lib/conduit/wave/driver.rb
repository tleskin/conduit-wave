module Conduit
  module Driver
    # Conduit Driver for the BeQuick Wave Api
    module Wave
      extend Conduit::Core::Driver

      required_credentials :token

      action :authenticate_user
      action :create_user
      action :create_message_template
      action :integration_create
      action :integration_list
      action :message_template_list
      action :profile_list
      action :create_profile
      action :send_message
      action :update_message_template
    end
  end
end
