require_relative '../utils/wls_resource'

class WlsManagedServer < WlsResource
  name 'wls_managed_server'
  desc 'wls managed server InSpec audit resource to test an Oracle tablespace'

  def initialize(name, weblogic_home: , url:, username:, password:)
    super
    @server_name = name
    @managed_server = fetch "/Servers/#{@server_name}"
    #
    # For all elements, create a method using it s key
    #
    process(@managed_server)
  end
end

