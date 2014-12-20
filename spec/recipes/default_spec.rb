require 'spec_helper'

describe 'uimod-tgt::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  before do
    # FIXME(MS): Needs to be fixed in recipes.
    commands = Array.new
    commands << "rpm -qa | grep jre| grep 1.7.0_67"
    commands << "chkconfig --list|grep apache-instance01"
    commands << "chkconfig --list|grep tomcat01"
    commands << "ps -aef|grep tomcat01"
    commands << "rpm -qa | grep jdk| grep 1.7.0_67"
    commands << "ps -aef|grep memcached | grep -v grep"
    commands.each do |cmd|
      stub_command(cmd).and_return(true)
    end
  end

  it 'tomcat 01 is restarted' do
    expect(chef_run).to restart_service('tomcat01')
  end

  it 'memcached is restarted' do
    expect(chef_run).to restart_service('memcached')
  end

  it 'apache-instance01 is restarted' do
    expect(chef_run).to restart_service('apache-instance01')
  end
end
