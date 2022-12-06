class SimuladorVenda < SitePrism::Page
    #-------------------------------------------------------------------#
    #                         E L E M E N T O S                         #
    #-------------------------------------------------------------------#
    element :lnk_simular_venda,   '#lnkSimulador'
    element :chk_contribuinte,    '#Contribuinte'
    element :btn_fechar,          '#simulador-modal-btn-cancelar'
    element :btn_confirmar,       '#header-ativar-simulacao'
    element :btn_icon_fechar,     '#simulador-close-icon'
    element :btn_cancelar,        '#header-cancelar-simulacao'
    element :preco_unit,          '.product-unit-price'  
    #-------------------------------------------------------------------#
    #                           M É T O D O S                           #
    #-------------------------------------------------------------------#
     def simular_venda(uf, consumo_revenda, contribuinte)
            lnk_simular_venda.click
            find('#Estado > option[value="'+ uf +'"]').select_option
            case consumo_revenda 
               when 'C'
                  find('#Consumo > option[value="true"]').select_option   
               else
                  find('#Consumo > option[value="false"]').select_option   
            end    

            if contribuinte == 'S'
                  chk_contribuinte.click  
            end      
     end

     def confirmar_simulador
            btn_confirmar.click
     end
     
     def cancelar_simulador
            lnk_simular_venda.click
            btn_cancelar.click
     end  

     def formatar_preco_unit
            preco_simulado = preco_unit.text
            preco_simulado = preco_simulado[3, preco_simulado.length] 
            preco_simulado = preco_simulado.gsub('.','')
            $preco_simulado = preco_simulado.gsub(',','.')
            puts $preco_simulado
     end  
end  