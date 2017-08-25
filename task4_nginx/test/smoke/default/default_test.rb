# # encoding: utf-8

# Inspec test for recipe task4_nginx::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


# This is an example test, replace it with your own test.
describe port(80)  do
  it { should be_listening }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl -IL http://localhost/') do
  its('stdout') { should match /200 OK/ }
end