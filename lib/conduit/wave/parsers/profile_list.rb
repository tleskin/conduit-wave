require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class ProfileList::Parser < Parser::Base
    attribute :profile_count do
      object_path('profiles').size
    end

    attribute :profiles do
      object_path('profiles').map do |profile_attr|
        instance_attr = profile_attributes_from(profile_attr)
        OpenStruct.new(instance_attr)
      end
    end

    def response_content?
      !object_path('profiles').nil?
    end

    private

    def profile_attributes_from(profile_attr = {})
      instance_attr_id = %w(name answer transcribable max_session_length tts_voice)
      instance_attr = profile_attr.slice(*instance_attr_id)
      instance_attr.merge('profile_id' => profile_attr['id'])
    end
  end
end
