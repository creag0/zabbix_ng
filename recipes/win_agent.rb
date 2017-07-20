
#####
# Still must fix hard coded paths!
#####S

# make this work with seven_zip coobook
include_recipe "seven_zip"


# Download Zabbix zip file
remote_file 'C:\\zabbix_agents_3.0.4.win.zip' do
	source node['zabbix_ng']['win_agent']['source']
	action :create
end

# Unzip Zabbix Agent media
seven_zip_archive 'zabbix_agent_source' do
  path      'C:\\zabbix_agents_3.0.4.win'
  source    'C:\\zabbix_agents_3.0.4.win.zip'
  overwrite true
  timeout   30
  not_if	{::File.exists?('C:\\zabbix_agents_3.0.4.win')}
end

# Install Zabbix Agent	
execute 'zabbix-agent' do
	command 'C:\\zabbix_agents_3.0.4.win\\bin\\win64\\zabbix_agentd.exe --config C:\\zabbix_agents_3.0.4.win\\conf\\zabbix_agentd.win.conf --install'
  #not_if  {::File.exists?('C:\\zabbix_agents_3.0.4.win')}
  	not_if 'sc query "Zabbix Agent" | find "RUNNING"'
end



