control 'VCPF-67-000029' do
  title 'Performance Charts must disable the shutdown port.'
  desc  "An attacker has at least two reasons to stop a web server. The first
is to cause a denial of service, and the second is to put in place changes the
attacker made to the web server configuration.

    If the Tomcat shutdown port feature is enabled, a shutdown signal can be
sent to Performance Chart through this port. To ensure availability, the
shutdown port must be disabled.
  "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # grep base.shutdown.port
/usr/lib/vmware-perfcharts/tc-instance/conf/catalina.properties

    Expected result:

    base.shutdown.port=-1

    If the output of the command does not match the expected result, this is a
finding.
  "
  desc 'fix', "
    Navigate to and open /etc/vmware-eam/catalina.properties.

    Navigate to the ports specification section.

    Add or modify the following line:

    base.shutdown.port=-1
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000435-WSR-000147'
  tag gid: 'V-239430'
  tag rid: 'SV-239430r675013_rule'
  tag stig_id: 'VCPF-67-000029'
  tag fix_id: 'F-42622r675012_fix'
  tag cci: ['CCI-002385']
  tag nist: ['SC-5']

  describe parse_config_file("#{input('catalinaPropertiesPath')}").params['base.shutdown.port'] do
    it { should eq "#{input('shutdownPort')}" }
  end
end
