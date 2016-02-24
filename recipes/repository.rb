#
# Cookbook Name:: zabbix_ng
# Recipe:: repository
#
# Copyright (C) 2015 Chris Aumann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Official Zabbix repository
apt_repository 'zabbix' do
  uri "http://repo.zabbix.com/zabbix/#{node['zabbix_ng']['zabbix_version']}/ubuntu"
  distribution node['lsb']['codename']
  components %w(main)
  key 'http://repo.zabbix.com/zabbix-official-repo.key'
end
