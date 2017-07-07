
# make this work with seven_zip coobook
include_recipe "seven_zip"


# Download Zabbix zip file
remote_file 'C:\\zabbix_agents_3.0.4.win.zip' do
	source node['zabbix_ng']['win_agent']['source']
	action :create
end

# make this work with seven_zip coobook
seven_zip_archive 'zabbix_agent_source' do
  path      'C:\\zabbix_agents_3.0.4.win'
  #source    'www.zabbix.com/downloads/3.0.4/zabbix_agents_3.0.4.win.zip'
  source    'C:\\zabbix_agents_3.0.4.win.zip'
  overwrite true
  timeout   30
  not_if	{::File.exists?('C:\\Program Files\\zabbix_agents_3.0.4.win')}
end
=begin

# Unzip Zabbix agent files
batch 'zabbix_agent_source' do
  code      '"C:\Program Files\7-Zip\7z.exe" x "C:\zabbix_agents_3.0.4.win.zip" -o"C:\zabbix_agents_3.0.4.win" -y'
  not_if	{::File.exists?('C:\\Program Files\\zabbix_agents_3.0.4.win')}
  Chef::Log.debug("install 7zip or run the seven_zip cookbook")
end
=end
# Install Zabbix Agent	
execute 'zabbix-agent' do
	command 'C:\\zabbix_agents_3.0.4.win\\bin\\win64\\zabbix_agentd.exe --config C:\\zabbix_agents_3.0.4.win\\conf\\zabbix_agentd.win.conf --install'
	#not_if {::File.exists?('C:\\zabbix_agents_3.0.4.win\\bin\\win64\\zabbix_agentd.exe')}
end



