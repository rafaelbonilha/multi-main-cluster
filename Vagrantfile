# Configuracao para criacao das VMs para o ambiente de teste local
# Lembrando de ajustar seu provedor na linha 24 para o da sua preferencia
#
 vms = {
  'balancer' => {'memory' => '256', 'cpus' => 1, 'ip' => '200'},
  'kirov-main3' => {'memory' => '3072', 'cpus' => 2, 'ip' => '30'},
  'kirov-main2' => {'memory' => '3072', 'cpus' => 2, 'ip' => '20'},
  'kirov-main1' => {'memory' => '3072', 'cpus' => 2, 'ip' => '10'},
  'kirov-node1' => {'memory' => '2048', 'cpus' => 1, 'ip' => '40'},
  'kirov-node2' => {'memory' => '2048', 'cpus' => 1, 'ip' => '50'},
  'kirov-node3' => {'memory' => '2048', 'cpus' => 1, 'ip' => '60'}
}

Vagrant.configure('2') do |config|


  config.vm.box = 'debian/bookworm64'
  config.vm.box_check_update = false
  
  vms.each do |name, conf|
    config.vm.define "#{name}" do |k|
      k.vm.hostname = "#{name}.example.com"
      k.vm.network 'private_network', ip: "172.27.11.#{conf['ip']}"
      k.vm.provider 'libvirt' do |vb|
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
      end
    end
  end
end
