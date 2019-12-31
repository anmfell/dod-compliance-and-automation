control "PHTN-10-000019" do
  title "The Photon operating system must allow only the ISSM (or individuals
or roles appointed by the ISSM) to select which auditable events are to be
audited."
  desc  "Without the capability to restrict which roles and individuals can
select which events are audited, unauthorized personnel may be able to prevent
the auditing of critical events. Misconfigured audits may degrade the system's
performance by overwhelming the audit log. Misconfigured audits may also make
it more difficult to establish, correlate, and investigate the events relating
to an incident or identify those responsible for one."
  tag severity: nil
  tag gtitle: "SRG-OS-000063-GPOS-00032"
  tag gid: nil
  tag rid: "PHTN-10-000019"
  tag stig_id: "PHTN-10-000019"
  tag fix_id: nil
  tag cci: "CCI-000171"
  tag nist: ["AU-12 b", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "AU-12 b"
  tag check: "At the command line, execute the following command:

# find /etc/audit/* -type f -exec stat -c \"%n permissions are %a\" {} $1\\;

If the permissions of any files are more permissive than 640, then this is a
finding."
  tag fix: "At the command line, execute the following command:

# chmod 640 <file>

Replace <file> with any file with incorrect permissions."

  command(' find /etc/audit/* -maxdepth 1 -type f').stdout.split.each do | fname |
    describe file(fname) do
      it { should_not be_more_permissive_than('0640') }
    end
  end

end

