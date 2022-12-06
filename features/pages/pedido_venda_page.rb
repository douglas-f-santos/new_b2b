class Pedido_venda < SitePrism::Page
    #-------------------------------------------------------------------#
    #                         E L E M E N T O S                         #
    #-------------------------------------------------------------------#
     element :btn_confirmar,  :xpath,      '//button[text()="Confirmar"]' 
     element :btn_continuar,  :xpath,      '//button[text()="Continuar"]' 
     element :btn_comprar, :xpath,         '//button[text()="Comprar"]'
     element :btn_proposta,                '#saveProposal'
     element :ipt_nome_proposta,           'input[name="Nickname"]'
     element :btn_email_proposta,          'input[name="Email"]'
     element :btn_salvar,                  '#save'
     element :btn_email_enviar,            '#sendmail'
     element :btn_confirmar_email,         'input[name="sendmail"]'
     element :lbl_status_email,            'td[class="product footable-last-column"]'
     element :btn_transformar_em_carrinho, 'input[name="sendtocart"]'
     element :btn_cancelar_proposta,       'input[name="cancel"]'
     element :btn_editar_proposta,         'input[name="editarproposta"]'
     element :btn_clonar_proposta,         'input[name="clonarproposta"]'   
     element :btn_finalizar_pedido,        '#checkout'
     element :rdb_avista_bnds,             'input[name="opcao"]'
     element :rdb_op_pagto_bnds,           'label[for="paymentmethod_0"]'
     element :rdb_op_pagto_boleto_sant,    'label[for="paymentmethod_1"]'
     element :rdb_op_pagto_deposito,       'label[for="paymentmethod_2"]'
     element :rdb_op_pagto_faturado,       'label[for="paymentmethod_3"]'
     element :rdb_op_pagto_pag_seguro,     'label[for="paymentmethod_4"]'
     element :rdb_cond_pagto_14,           '#faturado9'
     element :rdb_cond_pagto_21,           '#faturado22'
     element :rdb_cond_pagto_28,           '#faturado28'
     element :rdb_cond_pagto_21_28_35,     '#faturado70'
     element :rdb_cond_pagto_15_35_ddl,    '#faturado305'
     element :rdb_cond_pagto_45,           '#faturado553'
     element :btn_titular_cartao,          '#card-holder-name'
     element :btn_informar_cpf,            '#document'
     element :btn_numero_cartao,           '#card-number'
     element :btn_codigo_cartao,           '#card-code'
     element :btn_escolha_parcela,         '#installment'
     element :ipt_cnpj,                    '#checkout_attribute_3'
     element :btn_finalizar_cadastro_cli,  '#link-cadastro-cliente'
     element :ipt_licencas_email,          '#checkout_attribute_5'
     element :lbl_pedido,                  '.order-number' 
    #-------------------------------------------------------------------#
    #                           M É T O D O S                           #
    #-------------------------------------------------------------------#

     def initialize
            @cadastro = Cadastro.new

     end  
       
     def comprar_pedido_venda
            first('input[type="radio"]').click
            btn_comprar.click
     end   

     def salvar_proposta
            btn_proposta.click
     end   

     def preencher_dados_proposta
             $nome =  FFaker::Name.name 
             email = FFaker::Internet.email
             ipt_nome_proposta.set $nome
             btn_email_proposta.set email
             find('#StateId > option[value="183"').select_option  
             btn_salvar.click
     end      
     
     def enviar_proposta_email
            btn_email_enviar.click
            btn_confirmar_email.click
     end  

     def transformar_em_carrinho
            btn_transformar_em_carrinho.click
     end  

     def cancelar_proposta
            btn_cancelar_proposta.click  
     end  

     def editar_proposta
            btn_editar_proposta.click  
     end 
     
     def clonar_proposta
            btn_clonar_proposta.click
     end
     def tipo_faturamento(tipo_fat, tipo_uso)
            generate = CpfCnpjTools::Generator.new
            tipo_fat_uso = tipo_fat + '_' + tipo_uso
            email = FFaker::Internet.email
            $tipo_fat_uso = tipo_fat_uso

            case tipo_fat_uso
            when 'empresa_uso_consumo'
                  find('#checkout_attribute_1 > option[value="1"]').select_option  
                  find('#checkout_attribute_2 > option[value="5"]').select_option 
                  ipt_licencas_email.set email
                  btn_finalizar_pedido.click
            when 'empresa_comercializacao'
                  find('#checkout_attribute_1 > option[value="1"]').select_option  
                  find('#checkout_attribute_2 > option[value="6"]').select_option 
                  ipt_licencas_email.set email
                  btn_finalizar_pedido.click
            when 'cliente_n_cadastrado' 
                  sleep 3
                  find('#checkout_attribute_1 > option[value="2"]').select_option  
                  sleep 2
                  $cnpj_revenda = generate.generate_cnpj(formatted: true) 
                  sleep 2
                  ipt_cnpj.set $cnpj_revenda
                  sleep 1
                  ipt_licencas_email.set email
                  sleep 2
                  ipt_licencas_email.send_keys :tab
                  sleep 1
                  btn_finalizar_cadastro_cli.click
                  sleep 1
                  @cadastro.preencher_cadastro_cliente
                  @cadastro.gravar_dados_cliente
                  btn_continuar.click
            when 'cliente_cadastrado'   
                  sleep 2   
                  find('#checkout_attribute_1 > option[value="2"]').select_option  
                  cnpj_revenda = generate.generate_cnpj(formatted: true)  
                  sleep 2
                  ipt_cnpj.set '16.765.165/0001-94'
                  sleep 2
                  ipt_licencas_email.set email
                  sleep 2
                  ipt_licencas_email.send_keys :tab
                  sleep 3
                  btn_finalizar_cadastro_cli.click
                  sleep 2
                  btn_continuar.click
            end
     end
  
     def checkout_parte1
            btn_continuar.click

            if page.has_css?('label[for="shippingoption_0"]') then
                  btn_continuar.click
            end 

            if page.has_css?('label[for="paymentmethod_0"]') then
            end             
     end

     def venda_meu_cliente(tipo_fat)
            if tipo_fat == 'cliente' then
                  btn_continuar.double_click   
            end      
     end 

     def opcao_pagamento(opcoes_pagamento)
             $opcoes_pagamento = opcoes_pagamento

             case opcoes_pagamento
              when 'BNDES'
                    rdb_op_pagto_bnds.click
              when 'Boleto Santander'
                    rdb_op_pagto_boleto_sant.click
              when 'Deposito bancário'
                    rdb_op_pagto_deposito.click
              when 'Faturado'
                    rdb_op_pagto_faturado.click
              when 'PagSeguro'
                    rdb_op_pagto_pag_seguro.click
              end
     end 
     
     def opcao_faturado(opcoes_pagamento,cond_pagto)
            $opcoes_pagamento = opcoes_pagamento
            $cond_pagto = cond_pagto

            if opcoes_pagamento == 'Faturado' then

                  if page.has_css?('label[for="paymentmethod_3"]') then
                  end      

                  btn_continuar.click

                  case cond_pagto
                  when '14 dias'
                        rdb_cond_pagto_14.click
                  when '21 dias'
                        rdb_cond_pagto_21.click
                  when '28 dias'
                        rdb_cond_pagto_28.click
                  when '21/28/35'
                        rdb_cond_pagto_21_28_35.click
                  when '15/35 DDL'
                        rdb_cond_pagto_15_35_ddl.click
                  when '45 dias'
                        rdb_cond_pagto_45.click
                  end
            end
     end
   
     def checkout_parte2(opcoes_pagamento)
            btn_continuar.click

            if opcoes_pagamento == 'BNDES' then

                     if page.has_css?('#BNDES1078') then
                     end    

                     rdb_avista_bnds.click  
                     btn_continuar.click
                     sleep 6
                     btn_confirmar.click
            elsif opcoes_pagamento == 'Deposito bancário' then
                     if page.has_css?('.deposito-container') then
                     end      
                     btn_continuar.click
                     sleep 6
                     btn_confirmar.click
            elsif opcoes_pagamento == 'Boleto Santander' then 
                     if page.has_css?('#BOLETO1') then
                     end    
                     btn_continuar.click
                     sleep 6
                     btn_confirmar.click
            elsif opcoes_pagamento == 'Faturado' then 
                     sleep 6
                     btn_confirmar.click
            elsif opcoes_pagamento == 'PagSeguro' then 
                     btn_continuar.click
                     sleep 10
                     btn_confirmar.click                
            end  
     end

     def incluir_dados_cartao(opcoes_pagamento,numero_cartao,cod, data_exp, parcelas)
            if opcoes_pagamento == 'PagSeguro' then
                  cpf = '369.422.138-70'
                  nome =  'Douglas F Santos'
                  data_mes = data_exp[0..1]
                  data_ano = data_exp[3..6]

                  if page.has_css?('label[for="paymentmethod_4"]') then
                  end    
                  
                  btn_continuar.click
                  btn_titular_cartao.set nome
                  btn_informar_cpf.set cpf
                  find('#expiration-date-mounth > option[value="'+data_mes+'"]').select_option  
                  find('#expiration-date-year > option[value="'+data_ano+'"]').select_option 
                  sleep 3
                  btn_numero_cartao.set numero_cartao
                  sleep 2
                  btn_numero_cartao.send_keys :enter
                  sleep 3
                  btn_codigo_cartao.set cod
                  sleep 2
                  find('.seguro-parcelas-select > option[value="'+parcelas+'"]').select_option
                  sleep 2
            end      
     end 

     def gravar_dados_pedido(prod_servico)
            s = lbl_pedido.text
            pedido = s[21, 7] 

            if  $cond_pagto == nil then
                   $cond_pagto = ''
            end    
                  
            if  $valor_negociado == nil then
                  $valor_negociado = ''
            end     
            
            descricao = ';' + $tipo_fat_uso + ';' + $opcoes_pagamento + ';' + $cond_pagto
   
            $execucao.push("#{pedido}#{descricao}#{';'}#{$valor_negociado}#{';'}#{prod_servico}#{';'}#{$data_hora}")
   
            f = File.new("features/support/pedidos_novob2b/pedidos.txt", "a+")
   
            $execucao.each { |line| f.puts(line) }
   
            f.close
   
            $execucao = []
     end 
end  

