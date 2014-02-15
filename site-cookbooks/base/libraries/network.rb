begin
  require 'ipaddr'
rescue LoadError
    Chef::Log.error("Missing gem 'ipaddr'")
end

module Express42
  module Base
    module Network

      def net_get_networks(the_node=node)
        networks = { :private => [], :public => [] }

        private_conditions = []
        public_exclusions = []

        private_conditions << net1 = IPAddr.new("192.168.0.0/16")
        private_conditions << net2 = IPAddr.new("172.16.0.0/12")
        private_conditions << net3 = IPAddr.new("10.0.0.0/8")

        public_exclusions << net4 = IPAddr.new("127.0.0.1/8")
        public_exclusions << net5 = IPAddr.new("169.254.0.0/16")

        the_node["network"]["interfaces"].each do |interface|
          next if not interface[1]["addresses"] or interface[1]["state"] == "down"

          ip_addr = interface[1]["addresses"].select { |address, data| data["family"] == "inet" }.to_a[0]
          next if ip_addr.nil?
          ip_addr = ip_addr[0]


          if private_conditions.detect{ |pc| pc.include?(ip_addr) }
            networks[:private] << [ interface[0], ip_addr ]
            next
          end
          if not private_conditions.detect { |pc| pc.include?(ip_addr) } and not public_exclusions.each.detect { |pe| pe.include?(ip_addr) }
            networks[:public] << [ interface[0], ip_addr ]
            next
          end

        end
        return networks
      end

      def net_get_all_ip(the_node=node)
        ips=[]
        networks = net_get_networks(the_node)
        networks.each_pair do |cond,eth_ip_array|
          eth_ip_array.each do |eth_ip|
            ips << eth_ip[1]
          end
        end
        return ips
      end

      def net_get_public(the_node=node)
        return net_get_networks(the_node)[:public]
      end

      def net_get_private(the_node=node)
        return net_get_networks(the_node)[:private]
      end

      def get_private_ip_by_role(role)
        if n = search(:node, "role:#{role} AND chef_environment:#{node.chef_environment}").first
          net_get_private(n)[0][1]
        else
          raise "Role #{role} not found"
        end
      end

      def get_public_ip_by_role(role)
        if n = search(:node, "role:#{role} AND chef_environment:#{node.chef_environment}").first
          net_get_public(n)[0][1]
        else
          raise "Role #{role} not found"
        end
      end


    end
  end
end
