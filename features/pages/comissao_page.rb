class Comissao < SitePrism::Page
    #-------------------------------------------------------------------#
    #                         E L E M E N T O S                         #
    #-------------------------------------------------------------------#
    element :ipt_alterar_comissao,   'input[onchange="AlterarValorRevenda(event)"]'
    element :lbl_comissao,           'span[class="product-subtotal"]'
    #-------------------------------------------------------------------#
    #                           M É T O D O S                           #
    #-------------------------------------------------------------------#
     def calcular_comissao(percent)
            preco_tabela = lbl_comissao.text
            preco_tabela = preco_tabela[3, preco_tabela.length] 
            preco_tabela = preco_tabela.gsub('.','')
            preco_tabela = preco_tabela.gsub(',','.')
            valor_cliente = preco_tabela.to_f+((percent.to_f /  100.00) *  preco_tabela.to_f)
            valor_negociado = valor_cliente.round(2)
            $valor_negociado = valor_negociado.to_s.gsub('.',',')
     end

     def calcular_comissao_negativa(percent)
            preco_tabela = lbl_comissao.text
            preco_tabela = preco_tabela[3, preco_tabela.length] 
            preco_tabela = preco_tabela.gsub('.','')
            $preco_tabela = preco_tabela.gsub(',','.')
            valor_cliente = $preco_tabela.to_f-((percent.to_f /  100.00) *  $preco_tabela.to_f)
            valor_negociado = valor_cliente.round(2)
            $valor_negociado = valor_negociado.to_s.gsub('.',',')
     end

     def alterar_comissao
            ipt_alterar_comissao.double_click
            ipt_alterar_comissao.set  $valor_negociado
            ipt_alterar_comissao.send_keys :tab 
            sleep 10
     end 
end  