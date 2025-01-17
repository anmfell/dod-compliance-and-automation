control 'VCUI-70-000008' do
  title 'vSphere UI application files must be verified for their integrity.'
  desc  'Verifying the vSphere UI application code is unchanged from its shipping state is essential for file validation and nonrepudiation of the vSphere UI. There is no reason the MD5 hash of the RPM original files should be changed after installation, excluding configuration files.'
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, run the following command:

    # rpm -V vsphere-ui|grep \"^..5......\"|grep -v -E \"\\.prop|\\.pass|\\.xml\"

    If there is any output, this is a finding.
  "
  desc 'fix', "
    Reinstall the vCenter Server Appliance (VCSA) or roll back to a snapshot.

    VMware does not support modifying the vSphere UI installation files manually.
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000131-WSR-000051'
  tag gid: 'V-256785'
  tag rid: 'SV-256785r889354_rule'
  tag stig_id: 'VCUI-70-000008'
  tag cci: ['CCI-001749']
  tag nist: ['CM-5 (3)']

  describe command('rpm -V vsphere-ui|grep "^..5......"|grep -v -E "\.prop|\.pass|\.xml"') do
    its('stdout.strip') { should eq '' }
  end
end
