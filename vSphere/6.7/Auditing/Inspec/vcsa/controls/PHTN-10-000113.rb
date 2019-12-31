control "PHTN-10-000113" do
  title "The Photon operating system must send TCP timestamps."
  desc  "TCP timestamps are used to provide protection against wrapped sequence
numbers. It is possible to calculate system uptime (and boot time) by analyzing
TCP timestamps. These calculated uptimes can help a bad actor in determining
likely patch levels for vulnerabilities."
  tag severity: nil
  tag gtitle: "SRG-OS-000480-GPOS-00227"
  tag gid: nil
  tag rid: "PHTN-10-000113"
  tag stig_id: "PHTN-10-000113"
  tag fix_id: nil
  tag cci: "CCI-000366"
  tag nist: ["CM-6 b", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "CM-6 b"
  tag check: "At the command line, execute the following command:

# /sbin/sysctl -a --pattern \"net.ipv4.tcp_timestamps$\"

Expected result:

net.ipv4.tcp_timestamps = 1

If the output does not match the expected result, this is a finding."
  tag fix: "At the command line, execute the following commands:

# sed -i -e \"/^net.ipv4.tcp_timestamps/d\" /etc/sysctl.conf
# echo net.ipv4.tcp_timestamps=1>>/etc/sysctl.conf"

  describe kernel_parameter('net.ipv4.tcp_timestamps') do
    its('value') { should eq 1 }
  end

end

