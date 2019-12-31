control "PHTN-10-000123" do
  title "The Photon operating system must employ a deny-all, allow-by-exception
firewall policy for allowing connections to other systems."
  desc  "Failure to restrict network connectivity only to authorized systems
permits inbound connections from malicious systems. It also permits outbound
connections that may facilitate exfiltration of DoD data."
  tag severity: nil
  tag gtitle: "SRG-OS-000480-GPOS-00231"
  tag gid: nil
  tag rid: "PHTN-10-000123"
  tag stig_id: "PHTN-10-000123"
  tag fix_id: nil
  tag cci: "CCI-000366, CCI-002080"
  tag nist: nil
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "CM-6 b, CA-3 (5)"
  tag check: "At the command line, execute the following command:

# iptables -S| grep -E '\\-P'

Expected Result:

-P INPUT   DROP
-P FORWARD DROP
-P OUTPUT  ACCEPT

If the output does not match the expected result, this is a finding."
  tag fix: "Inside vCenter, remove any manually configured firewall rules. At
the command line, execute the following command to revert the firewall rules
back to the default state which has the appropriate policies configured:

/usr/lib/applmgmt/networking/bin/firewall-reload.py"

  describe iptables do
    it { should have_rule('-P INPUT DROP') }
    it { should have_rule('-P FORWARD DROP') }
    it { should have_rule('-P OUTPUT ACCEPT') }
  end

end

