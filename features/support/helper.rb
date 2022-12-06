Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module PageObjects

    def login
           @login ||= Login.new
    end

    def home
           @home ||= Home.new
    end

    def cadastro
           @cadastro ||= Cadastro.new
    end    

    def pedido_compra
           @pedido_compra ||= Pedido_compra.new
    end

    def pedido_venda
           @pedido_venda ||= Pedido_venda.new
    end
  
    def util
           @util ||= Util.new
    end  

    def clientes
          @clientes ||= Clientes.new
    end  

    def qrycrmdados
           @qrycrmdados ||= QryCrmDados.new
    end  

    def orcamento
           @orcamento ||= Orcamento.new
    end  

    def carrinhocompras
          @carrinhocompras ||= CarrinhoCompras.new
    end 

    def pdp
          @pdp ||= PDP.new
    end 

    def minhaconta
          @minhaconta ||= MinhaConta.new
    end 

    def comissao
       @comissao ||= Comissao.new
    end 

    def simuladorvenda
       @simuladorvenda ||= SimuladorVenda.new
    end 

    def sqlserver
       @sqlserver ||= SqlServer.new
    end 
end    

     module Helper
       def printscreen(nome_arquivo, resultado)
       #     caminho_arquivo = "results/screenshots/test_#{resultado}"
       #     printsc = "#{caminho_arquivo}/#{nome_arquivo}.png"
       #     page.save_screenshot(printsc)
       #     embed(printsc, 'image/png', 'Clique aqui')
       end
     end      
   
 



  