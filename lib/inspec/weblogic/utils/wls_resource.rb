libdir = Pathname.new(__FILE__).parent.parent.parent + 'lib'
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
require_relative './helpers'
require_relative './object'
require_relative './string'

class WlsResource < Inspec.resource(1)
  include Helpers

  def initialize(name, weblogic_home:, url:, username:, password: )
    @url           = url
    @weblogic_home = weblogic_home
    @username      = username
    @password      = password
  end

  def fetch(path)
    template_file = (Pathname.new(__FILE__).dirname + 'execute.py.erb')
    template = File.read(template_file)
    input_file  = tempfile_name(['input', '.py'])
    remote_file = "/tmp/" + Pathname(input_file).basename.to_s
    output_file = "/tmp/" + Pathname(tempfile_name(['output', '.csv'])).basename.to_s
    content = ERB.new(template, nil, '-').result(binding)
    File.open(input_file, 'w') { |f| f.write(content) }
    inspec.backend.upload(input_file, remote_file)

    cmd = inspec.command(command_string(remote_file))
    cmd.stdout
    fail cmd.stderr if cmd.stderr != ''
    output = inspec.file(output_file).content
    #
    # Cleanup
    #
    inspec.command("rm -f #{remote_file} #{output_file}").stdout
    data = convert_csv_data_to_hash(output, [], :col_sep => ';')
    Hash[data.collect{|e| [e['key'], e['value']]}]
  end

  private

  def tempfile_name(options = [])
    tmp_file = Tempfile.new(options)
    path = tmp_file.path
    path
  end

  def command_string( script)
    ". #{@weblogic_home}/server/bin/setWLSEnv.sh;java -Dweblogic.security.SSL.ignoreHostnameVerification=true weblogic.WLST -skipWLSModuleScanning #{script}"
  end

  def process(values)
    values.each do |path, value|
      key = path.split('/').last
      key = key.underscore
      value = "\"#{value}\"" unless value.is_number?
      self.class.class_eval <<-EOD, __FILE__, __LINE__
        def #{key}
          #{value}
        end
      EOD
    end
  end

end

