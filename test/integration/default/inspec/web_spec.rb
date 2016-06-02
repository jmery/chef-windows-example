# More info on inspec https://github.com/chef/inspec
# The IIS components we need should be installed
describe windows_feature('Web-Server') do
  it { should be_installed }
end

describe windows_feature('Web-Asp-Net45') do
  it { should be_installed }
end

describe windows_feature('Web-Mgmt-Console') do
  it { should be_installed }
end

#  It should be responding on port 80 and returning 200
describe port(80) do
  it { should be_listening }
end

site_response_script = <<-EOH
  Invoke-WebRequest http://localhost  -UseBasicParsing | % {$_.StatusCode}
EOH

describe powershell(site_response_script) do
  its('stdout') { should match(/^200/) }
end

#  It should be serving the content we put up there
site_content_script = <<-EOH
  Invoke-WebRequest http://localhost  -UseBasicParsing | % {$_.Content}
EOH

describe powershell(site_content_script) do
  its('stdout') { should match(/Fourth Coffee/) }
end
