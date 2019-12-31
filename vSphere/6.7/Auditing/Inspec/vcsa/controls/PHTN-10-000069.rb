control "PHTN-10-000069" do
  title "The Photon operating system must implement address space layout
randomization to protect its memory from unauthorized code execution."
  desc  "Address space layout randomization (ASLR) makes it more difficult for
an attacker to predict the location of attack code he or she has introduced
into a process's address space during an attempt at exploitation. Additionally,
ASLR also makes it more difficult for an attacker to know the location of
existing code in order to repurpose it using return-oriented programming (ROP)
techniques."
  tag severity: nil
  tag gtitle: "SRG-OS-000433-GPOS-00193"
  tag gid: nil
  tag rid: "PHTN-10-000069"
  tag stig_id: "PHTN-10-000069"
  tag fix_id: nil
  tag cci: "CCI-002824"
  tag nist: ["SI-16", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "SI-16"
  tag check: "At the command line, execute the following command:

# cat /proc/sys/kernel/randomize_va_space

If the value of randomize_va_space is not 2, this is a finding."
  tag fix: "Open /etc/sysctl.d/50-security-hardening.conf with a text editor
and ensure that the \"randomize_va_space\" is uncommented and set to the
following:

kernel.randomize_va_space=2

At the command line, execute the following command:

# sysctl --system"

  describe kernel_parameter('kernel.randomize_va_space') do
    its('value') { should eq 2 }
  end

end

