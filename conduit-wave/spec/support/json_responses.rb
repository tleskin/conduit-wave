# Sample json responses from the AtomApi
module JsonResponses
  def query_line_json_response
    "{\"lines\":[{\"id\":1,\"subscriber_id\":1,\"mdn\":\"8658248958\",\"status\":\"active\",\"carrier_id\":1,\"nid\":\"270113177701766880\",\"nid_type\":\"esn\",\"service_zip\":\"33410\",\"created_at\":\"2014-04-28T16:58:43.000-04:00\",\"updated_at\":\"2014-04-28T16:58:43.000-04:00\",\"activated_at\":\"2014-04-28T16:58:38.000-04:00\",\"status_updated_at\":\"2014-04-28T16:58:38.000-04:00\",\"last_conduit_request_status\":\"success\",\"last_conduit_request_action\":\"reset_voicemail\",\"conduit_request_ids\":[1,2]}],\"meta\":{\"pagination\":{\"current_page\":1,\"total_pages\":1,\"total_count\":1}}}"
  end

  def send_message_json_response
    "{\"outbound_messages\":[{\"recipient\":\"+18643604881\",\"message\":\"Your PIN is 123456\",\"message_template_id\":1,\"identifier\":\"SMe74b9a50951649e1842897dc92aa30b1\",\"state\":\"delivering\",\"id\":8,\"created_at\":\"2014-06-10T18:22:13.579Z\",\"updated_at\":\"2014-06-10T18:22:14.519Z\"}],\"meta\":{}}"
  end

  def create_message_template_json_response
    "{\"message_templates\":[{\"body\":\"This is a test.\",\"sender\":\"+17205482691\",\"delivery_mechanism\":\"sms\",\"id\":2,\"created_at\":\"2014-06-10T17:35:13.422Z\",\"updated_at\":\"2014-06-10T17:35:13.422Z\",\"profile_id\":1}],\"meta\":{}}"
  end

  def update_message_template_json_response
    "{\"message_templates\":[{\"body\":\"This is only a test.\",\"sender\":\"+17205482691\",\"delivery_mechanism\":\"sms\",\"id\":2,\"created_at\":\"2014-06-10T17:35:13.422Z\",\"updated_at\":\"2014-06-10T17:36:43.919Z\",\"profile_id\":1}],\"meta\":{}}"
  end

  def list_message_templates_json_response
    "{\"message_templates\":[{\"body\":\"Your PIN is {{pin}}\",\"sender\":\"+17205482691\",\"delivery_mechanism\":\"sms\",\"id\":1,\"created_at\":\"2014-06-10T15:54:21.622Z\",\"updated_at\":\"2014-06-10T15:54:21.622Z\",\"profile_id\":1},{\"body\":\"This is only a test.\",\"sender\":\"+17205482691\",\"delivery_mechanism\":\"sms\",\"id\":2,\"created_at\":\"2014-06-10T17:35:13.422Z\",\"updated_at\":\"2014-06-10T17:36:43.919Z\",\"profile_id\":1}],\"meta\":{}}"
  end

  def list_profiles_json_response
    "{\"profiles\":[{\"provider\":\"twilio\",\"tts_voice\":\"alice\",\"max_session_length\":null,\"answer\":true,\"name\":\"twilio ivr profile\",\"transcribable\":true,\"application_identifiers\":null,\"id\":1,\"created_at\":\"2014-06-10T20:14:48.308Z\",\"updated_at\":\"2014-06-10T20:14:48.308Z\",\"script_ids\":[1],\"call_routing_ids\":[1]}],\"meta\":{}}"
  end

  def error_json_response
    "{\"errors\":[\"CLEC Profile not found\"]}"
  end
end
