

include_recipe "seven_zip"


# Download Zabbix zip file
remote_file node['zabbix_ng']['win_agent']['inst_media'] do
	source node['zabbix_ng']['win_agent']['source']
	action :create
end

# Unzip Zabbix Agent media
seven_zip_archive 'zabbix_agent_source' do
  path      node['zabbix_ng']['win_agent']['inst_dir']
  source    node['zabbix_ng']['win_agent']['inst_media']
  overwrite true
  timeout   30
	not_if	"::File.exists?#{node['zabbix_ng']['win_agent']['inst_dir']}"
end

# Install Zabbix Agent
execute 'zabbix-agent' do
	command node['zabbix_ng']['win_agent']['inst_dir'] + '\\bin\\win64\\zabbix_agentd.exe --config C:\\zabbix_agents_3.0.4.win\\conf\\zabbix_agentd.win.conf --install'
  	not_if 'sc query "Zabbix Agent" | find "RUNNING"'
end
