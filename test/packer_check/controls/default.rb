# default.rb

control 'build_filesystem_check' do
  impact 0.7
  title 'Test filesystem components for image build'
  desc '
  Here is a longer description of what we want for this build.
  We might state here something along the lines of our company policies and why
  it is important to run these tests.
  '

  # http://inspec.io/docs/reference/resources/file/
  describe file('/tmp') do
    it { should exist }
    it { should be_directory }
  end
end

control 'build_user_check' do
  impact 0.7
  title 'Test user and group components for image build'
  desc '
  Here is a longer description of what we want for this build.
  We might state here something along the lines of our company policies and why
  it is important to run these tests.
  '

  # http://inspec.io/docs/reference/resources/user/
  describe user('ubuntu') do
    it { should exist }
  end

  # http://inspec.io/docs/reference/resources/group/
  describe group('ubuntu') do
    it { should exist }
  end
end

control 'build_service_check' do
  impact 0.7
  title 'Test package and service components for image build'
  desc '
  Here is a longer description of what we want for this build.
  We might state here something along the lines of our company policies and why
  it is important to run these tests.
  '

  # http://inspec.io/docs/reference/resources/package/
  describe package('nginx') do
    it { should be_installed }
  end

  # http://inspec.io/docs/reference/resources/service/
  describe service('nginx') do
    it { should be_running }
    it { should be_enabled }
  end
end
