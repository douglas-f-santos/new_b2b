class CarrinhoCompras < SitePrism::Page
   #-------------------------------------------------------------------#
   #                         E L E M E N T O S                         #
   #-------------------------------------------------------------------#
   element :ipt_pesquisa_home,                '#small-searchterms'
   element :btn_pesquisar, :xpath,            '//button[text()="Pesquisar"]'
   element :btn_comprar, :xpath,              '//button[text()="Comprar"]'
   element :lnk_acessar_carrinho_compras,     '#flyout-cart'    
   element :ipt_qtd_produto,                 '.quantity > input'
   element :btn_remover_prod,                 '.remove-btn'

   #-------------------------------------------------------------------#
   #                           M É T O D O S                           #
   #-------------------------------------------------------------------#

    def efetuar_pesquisa(produto)
           ipt_pesquisa_home.set produto
           btn_pesquisar.click
    end    

    def adicionar_produto_carrinho
           first(:xpath,'//span[text()="Comprar"]').click
           first('input[type="radio"]').click
           btn_comprar.click
           first(:xpath,'//button[text()="Ir para o carrinho"]').click
    end   
    
    def acessar_carrinho
           first('#flyout-cart').hover
           first(:xpath,'//button[text()="Ir para o carrinho"]').click
    end   

    def atualizar_qtd_produto(quantidade)
           lnk_acessar_carrinho_compras.click
           first('.quantity > input').set quantidade
           first(:xpath,'//button[text()="Atualizar carrinho de compras"]').click
    end  

    def remover_produto
          lnk_acessar_carrinho_compras.click
          first('.remove-btn').click
    end  
end