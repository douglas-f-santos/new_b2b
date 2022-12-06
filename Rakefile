require 'rake'
require 'yaml'

desc 'Executar pedido venda'
task :pedido_crm do 
      limpar
      pedido_crm
           CONFIG = YAML.load_file(File.dirname(__FILE__) + "/features/support/ambientes/12_1_27_BD.yml")
           CONFIG['falhas_crm'] = 'reexecutar'
           File.write("./features/support/ambientes/12_1_27_BD.yml", CONFIG.to_yaml)

      ret_rerun = File.zero?('./rerun.txt')
      if ret_rerun == false  
           rexecutar_crm
           execucao =[]
           arq_f = File.new("./rerun.txt", "w")
           execucao.each { |line| arq_f.puts(line) }
           arq_f.close
      end   
       #      execdemais
end

def limpar 
       system 'cucumber -t @LimparDados'
end

def pedido_crm
       system 'cucumber -t @GerarPedidoVenda -f rerun --out rerun.txt'    
end

def rexecutar_crm
       system 'cucumber @rerun.txt'    
end

def execdemais
       system 'cucumber -t @LiberacaoGerente'
       system 'cucumber -t @LiberacaoCredito'
       system 'cucumber -t @LiberarPedidoVendaProt'
       # system 'cucumber -t @ConsultarPedidoVendaProt'
       # system 'cucumber -t @PrepDocSaida'
       # system 'cucumber -t @NfeSefaz'
       # system 'cucumber -t @ImprimirSefaz'
end



