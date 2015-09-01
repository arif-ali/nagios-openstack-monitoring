Monitoring Openstack using Nagios3 and NRPE agents

- Overall Requirements:
	- Server: nagios3
	- Client Node: nagios-nrpe-server
	- API Checks: Openstack tenant with username and password. In these scripts a tenant: cookbook with username: admin and password: openstack has been used.
	- check_service.sh plugin from https://exchange.nagios.org/directory/Plugins/Network-and-Systems-Management/Unix-2FLinux-Check-Service-Status/details

- Keystone:
	- Nagios Server:
		- Host config: nagios-server/etc/nagios3/conf.d/openstack_controller_keystone_host.cfg
		- Service config: nagios-server/etc/nagios3/conf.d/openstack_controller_keystone_service.cfg
	- Nagios Agent:
		- NRPE plugins: 
			- client-os-controller-keystone/usr/lib/nagios/plugins/check_keystone
			- client-os-controller-keystone/usr/lib/nagios/plugins/check_service.sh
		- NRPE commands:
			- client-os-controller-keystone/etc/nagios/nrpe.d/openstack_keystone_checks.cfg

- Glance:
	- Nagios Server:
		- Host config: nagios-server/etc/nagios3/conf.d/openstack_controller_glance_host.cfg
		- Service config: nagios-server/etc/nagios3/conf.d/openstack_controller_glance_service.cfg
	- Nagios Agent:
		- NRPE plugins: 
			- client-os-controller-glance/usr/lib/nagios/plugins/check_glance_api
			- client-os-controller-glance/usr/lib/nagios/plugins/check_service.sh
		- NRPE commands:
			- client-os-controller-glance/etc/nagios/nrpe.d/openstack_glance_checks.cfg


- Cinder:
	- Volume Controller:
		- Nagios Server:
			- Host config: nagios-server/etc/nagios3/conf.d/openstack_controller_cinder_host.cfg
			- Service config: nagios-server/etc/nagios3/conf.d/openstack_controller_cinder_service.cfg
		- Nagios Agent:
			- NRPE plugins: 
				- client-os-controller-cinder/usr/lib/nagios/plugins/check_cinder-api
				- client-os-controller-cinder/usr/lib/nagios/plugins/check_service.sh
			- NRPE commands:
				- client-os-controller-cinder/etc/nagios/nrpe.d/openstack_cinder_controller_checks.cfg
	- Volume node:
		- Nagios Server:
			- Host config: nagios-server/etc/nagios3/conf.d/openstack_node_cinder_host.cfg
			- Service config: nagios-server/etc/nagios3/conf.d/openstack_node_cinder_service.cfg
		- Nagios Agent:
			- NRPE plugins: 
				- client-os-controller-cinder/usr/lib/nagios/plugins/check_service.sh
			- NRPE commands:
				- client-os-controller-cinder/etc/nagios/nrpe.d/openstack_cinder_node_checks.cfg
	
- Nova:
	- Compute Controller:
		- Nagios Server:
			- Host config: nagios-server/etc/nagios3/conf.d/openstack_controller_nova_host.cfg
			- Service config: nagios-server/etc/nagios3/conf.d/openstack_controller_nova_service.cfg
		- Nagios Agent:
			- NRPE plugins: 
				- client-os-controller-nova/usr/lib/nagios/plugins/check_nova-api
				- client-os-controller-nova/usr/lib/nagios/plugins/check_service.sh
			- NRPE commands:
				- client-os-controller-nova/etc/nagios/nrpe.d/openstack_nova_controller_checks.cfg

	- Compute Node:
		- Nagios Server:
			- Host config: nagios-server/etc/nagios3/conf.d/openstack_node_nova_host.cfg
			- Service config: 
				- nagios-server/etc/nagios3/conf.d/openstack_node_nova_service.cfg
				- nagios-server/etc/nagios3/conf.d/openstack_node_kvm_service.cfg
		- Nagios Agent:
			- NRPE plugins: 
				- client-os-controller-nova/usr/lib/nagios/plugins/check_nova-api
				- client-os-controller-nova/usr/lib/nagios/plugins/check_service.sh
				- client-os-controller-nova/usr/lib/nagios/plugins/check_kvm_cpustats
				- client-os-controller-nova/usr/lib/nagios/plugins/check_kvm_instance
				- client-os-controller-nova/usr/lib/nagios/plugins/check_kvm_memstats
			- NRPE commands:
				- client-os-controller-nova/etc/nagios/nrpe.d/openstack_nova_node_checks.cfg
				- client-os-controller-nova/etc/nagios/nrpe.d/openstack_kvm_checks.cfg
	
- Swift:
	- Object Store Controller:
		- Nagios Server:
			- Host config: nagios-server/etc/nagios3/conf.d/openstack_controller_swift_host.cfg
			- Service config: nagios-server/etc/nagios3/conf.d/openstack_controller_swift_service.cfg
		- Nagios Agent:
			- NRPE plugins: 
				- client-os-controller-nova/usr/lib/nagios/plugins/check_swift
			- NRPE commands:
				- client-os-controller-swift/etc/nagios/nrpe.d/openstack_swift_controller_checks.cfg

	- Object Store Node:
		- Nagios Server:
			- Host config: nagios-server/etc/nagios3/conf.d/openstack_node_swift_storage_{1..4}_host.cfg
			- Host Group config: nagios-server/etc/nagios3/conf.d/openstack_node_swift_hostgroup.cfg
			- Service config: nagios-server/etc/nagios3/conf.d/openstack_node_swift_storage_service.cfg
		- Nagios Agent:
			- NRPE plugins: 
				- No custom plugin.
			- NRPE commands:
				- client-os-node-swift/etc/nagios/nrpe.d/openstack_swift_node_checks.cfg

License
	 nagios-openstack-monitoring
	 (https://github.com/rakesh-patnaik/nagios-openstack-monitoring)
	
	 nagios-openstack-monitoring is free software: you can redistribute it and/or modify
	 it under the terms of the GNU General Public License as published by
	 the Free Software Foundation, either version 3 of the License, or
	 (at your option) any later version.
	
	 nagios-openstack-monitoring is distributed in the hope that it will be useful,
	 but WITHOUT ANY WARRANTY; without even the implied warranty of
	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 GNU General Public License for more details.
	
	 You should have received a copy of the GNU General Public License
	 along with nagios-openstack-monitoring.  If not, see <http://www.gnu.org/licenses/>.>.
