   Quando("efetuar login com {string} e senha") do |user|
      login.cookies_ok
      login.logar_com_user(user)
   end 
   
   Quando("efetuar login com user e senha") do
      login.cookies_ok
      login.logar
   end 

   Quando("efetuar login com {string} e {string}") do |user, pass|
      login.cookies_ok
      login.logar_com_user_senha(user,pass)
   end 
            
   E('deslogar do sistema') do
      login.logout
   end  

   E("entrar em esquecer minha senha") do
      login.cookies_ok
      login.esqueci_minha_senha
   end  

   E("acessar a minha conta") do
     login.minha_conta
     login.acessar_conta
   end  

   E("recuperar senha com {string}") do |user|
      login.preencher_email(user)
   end  

   E("alterar a senha do usuário") do
      login.acessar_usuario
      login.alterar_senha
      login.preencher_nova_senha
   end  

   E("efetuar a busca de {string}") do |produto|
      carrinhocompras.efetuar_pesquisa(produto)
   end

   E("cadastrar revenda {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string}") do |user, inscr_mun, suframa, simples_nac, anexo,inscr_estadual, website, email_nfe, compl_cob, compl_ent, compl_fat, msm_end_ent, msm_end_fat|
      login.cookies_ok
      cadastro.cadastar_revenda
      cadastro.preencher_cadastro(user, inscr_mun, suframa, simples_nac, anexo,inscr_estadual, website, email_nfe, compl_cob, compl_ent, compl_fat, msm_end_ent, msm_end_fat)
      cadastro.gravar_dados_revenda
   end  
   "<user>" "<inscr_mun>" "<suframa>" "<data_fundacao>" "<simples_nac>" "<anexo>" "<inscr_estadual>" "<website>" "<email_nfe>"
   Quando("gerar proposta") do 
      pedido_venda.comprar_pedido_venda
      carrinhocompras.acessar_carrinho
      pedido_venda.salvar_proposta
      pedido_venda.preencher_dados_proposta
   end

   Quando("gerar pedido com condicao de pagamento {string} {string} {string} {string} {string} {string} {string} {string}") do |opcoes_pagamento,numero_cartao,cod, data_exp, parcelas, tipo_fat, tipo_uso, prod_servico|
      pedido_venda.comprar_pedido_venda
      carrinhocompras.acessar_carrinho
      pedido_venda.tipo_faturamento(tipo_fat, tipo_uso)
      pedido_venda.checkout_parte1
      pedido_venda.venda_meu_cliente(tipo_fat)
      pedido_venda.opcao_pagamento(opcoes_pagamento)
      pedido_venda.incluir_dados_cartao(opcoes_pagamento,numero_cartao,cod, data_exp,parcelas)
      pedido_venda.checkout_parte2(opcoes_pagamento)
      pedido_venda.gravar_dados_pedido(prod_servico)
   end

   Quando("gerar pedido com condicao de pagamento {string} {string} {string} {string} {string}") do |opcoes_pagamento, cond_pagto, tipo_fat, tipo_uso, prod_servico|
      pedido_venda.comprar_pedido_venda
      carrinhocompras.acessar_carrinho
      pedido_venda.tipo_faturamento(tipo_fat, tipo_uso)
      pedido_venda.checkout_parte1
      pedido_venda.venda_meu_cliente(tipo_fat)
      pedido_venda.opcao_pagamento(opcoes_pagamento)
      pedido_venda.opcao_faturado(opcoes_pagamento,cond_pagto)
      pedido_venda.checkout_parte2(opcoes_pagamento)
      pedido_venda.gravar_dados_pedido(prod_servico)
   end

   Quando("gerar pedido com condicao de pagamento {string} {string} {string} {string}") do |opcoes_pagamento, tipo_fat, tipo_uso, prod_servico|
      pedido_venda.comprar_pedido_venda
      carrinhocompras.acessar_carrinho
      pedido_venda.tipo_faturamento(tipo_fat, tipo_uso)
      pedido_venda.checkout_parte1
      pedido_venda.venda_meu_cliente(tipo_fat)
      pedido_venda.opcao_pagamento(opcoes_pagamento)
      pedido_venda.checkout_parte2(opcoes_pagamento)
      pedido_venda.gravar_dados_pedido(prod_servico)
   end

   Quando("gerar pedido com comissao {string} {string} {string} {string} {string}") do |opcoes_pagamento, tipo_fat, tipo_uso, percent, prod_servico|
      pedido_venda.comprar_pedido_venda
      carrinhocompras.acessar_carrinho
      pedido_venda.tipo_faturamento(tipo_fat, tipo_uso)
      pedido_venda.checkout_parte1
      comissao.calcular_comissao(percent)
      comissao.alterar_comissao
      pedido_venda.venda_meu_cliente(tipo_fat)
      pedido_venda.opcao_pagamento(opcoes_pagamento)
      pedido_venda.checkout_parte2(opcoes_pagamento)
      pedido_venda.gravar_dados_pedido(prod_servico)
   end

   Quando("gerar pedido com comissao negativa {string} {string} {string} {string} {string}") do |opcoes_pagamento, tipo_fat, tipo_uso, percent, prod_servico|
      pedido_venda.comprar_pedido_venda
      carrinhocompras.acessar_carrinho
      pedido_venda.tipo_faturamento(tipo_fat, tipo_uso)
      pedido_venda.checkout_parte1
      comissao.calcular_comissao_negativa(percent)
      comissao.alterar_comissao
      pedido_venda.venda_meu_cliente(tipo_fat)
      pedido_venda.opcao_pagamento(opcoes_pagamento)
      pedido_venda.checkout_parte2(opcoes_pagamento)
      pedido_venda.gravar_dados_pedido(prod_servico)
   end

   Quando("salvar a proposta") do
      pedido_venda.enviar_proposta_email
   end

   Quando("transformar proposta em carrinho") do
      pedido_venda.transformar_em_carrinho
   end

   Quando("cancelar a proposta") do
      pedido_venda.cancelar_proposta
   end

   Quando("editar a proposta") do
      pedido_venda.editar_proposta
      pedido_venda.preencher_dados_proposta
   end

   Quando("clonar a proposta") do
      pedido_venda.clonar_proposta
      pedido_venda.preencher_dados_proposta
   end
           
   Quando("ativar simulador de vendas {string} {string} {string}") do |uf,consumo_revenda, contribuinte|
      simuladorvenda.simular_venda(uf,consumo_revenda, contribuinte)
      simuladorvenda.confirmar_simulador
   end

   Quando("cancelar simulador de vendas") do
      simuladorvenda.cancelar_simulador
   end

   Quando("adicionar produto ao carrinho") do 
      carrinhocompras.adicionar_produto_carrinho
   end

   Quando("atualizar quantidade do produto no carrinho {string}") do |quantidade|
      carrinhocompras.atualizar_qtd_produto(quantidade)
   end

   Quando("remover produto do carrinho") do
      carrinhocompras.remover_produto
   end

   Quando("acessar a pagina do produto {string}") do |url|
      visit(url)
   end

   Quando("acessar a pagina do produto e adicionar produto {string} {string}") do |url1, url2|
      visit(url1)
      pedido_venda.comprar_pedido_venda
      visit(url2)
   end


   Quando("acessar o link {string} {string}") do |grupo, link|
      home.acessar_link(grupo, link)
   end
   
   Quando("acessar o link mais {string} {string} {string}") do |grupo, link_mais, sub_link|
      home.acessar_link_mais(grupo, link_mais, sub_link)
   end

   Quando("criar um novo convidado {string} {string} {string} {string} {string} {string} {string}") do |efetuar_compra,acessar_comissoes,visu_proprias_comissoes,acessar_status_pedido,visu_proprios_status,criar_convidado,limite_compra|
      minhaconta.acessar_convidado
      minhaconta.criar_convidado
      minhaconta.preencher_dados_convidado
      minhaconta.permissao_usuario(efetuar_compra,acessar_comissoes,visu_proprias_comissoes,acessar_status_pedido,visu_proprios_status,criar_convidado,limite_compra)
      minhaconta.criar_usuario
      minhaconta.gravar_dados_convidado
   end
   
   Quando("excluir um convidado") do 
      minhaconta.acessar_convidado
      minhaconta.buscar_user_delete
   end
   
   Quando("acessar 2via de boleto {string} {string}") do |cnpj, pedido|
      minhaconta.acessar_2via_bol
      minhaconta.preencher_dados_2via_bol(cnpj,pedido)
   end
   
   Quando("acessar leasing e financiamento") do 
      minhaconta.acessar_leasing_finan
   end   

   Quando("acessar central de atendimento") do 
      minhaconta.acessar_central_atendimento
   end   

   Quando("acessar 2bcloud") do 
      minhaconta.acessar_2bcloud
   end   

   Quando("acessar cadastro") do 
      minhaconta.acessar_cadastro
   end   

   Quando("acessar alterar senha") do 
      minhaconta.acessar_alt_senha
      login.preencher_nova_senha
   end   

   Quando("acessar disponibilidade") do 
      minhaconta.acessar_disponib
   end   

   Quando("acessar comissao {string} {string} {string} {string} {string}") do |data_inicio,data_fim,status,comissao,idpedido|
      minhaconta.acessar_comissao
      minhaconta.pesquisar_comissao(data_inicio, data_fim, status, comissao,idpedido)
   end   

   Quando("acessar pedido") do 
      minhaconta.acessar_pedido
   end   

   Quando("visualizar a proposta") do 
      minhaconta.acessar_propostas
      minhaconta.visualizar_propostas
   end   

   Quando("editar permissao de convidado {string} {string} {string} {string} {string} {string} {string}") do |efetuar_compra,acessar_comissoes,visu_proprias_comissoes,acessar_status_pedido,visu_proprios_status,criar_convidado,limite_compra|
      minhaconta.acessar_convidado
      minhaconta.buscar_user_editar
      minhaconta.permissao_usuario(efetuar_compra,acessar_comissoes,visu_proprias_comissoes,acessar_status_pedido,visu_proprios_status,criar_convidado,limite_compra)
      minhaconta.salvar_edicao
   end   

   Dado('que o usuário acesse o novo B2B') do
      login.load
   end
   
   Entao("a disponibilidade será visualizada") do
      expect(page).to have_text 'AVISO DE DISPONIBILIDADE'
   end

   Então("a PDP será validada com sucesso {string} {string} {string} {string} {string} {string}") do |fabricante, sku, centro_distribuicao, descr, descr_curta, img|
       expect(pdp.lbl_fabricante.text).to have_text fabricante
       expect(pdp.lbl_sku.text).to have_text sku
       expect(pdp.lbl_attributes.text).to have_text centro_distribuicao
       expect(pdp.lbl_item.text).to have_text descr
       expect(pdp.lbl_product_name.text).to have_text descr
       expect(pdp.lbl_short_descr.text).to have_text descr_curta
       expect(page).to have_css '.add-to-cart-panel'
       expect(page).to have_css img
   end

   Então("será realizado o login com sucesso {string}") do |mensagem|
       login.minha_conta
       expect(page).to have_text mensagem
   end

   Então("será exibida a mensagem {string}") do |mensagem|
      expect(page).to have_text mensagem
   end

   Então("o logout será realizado com sucessso") do 
       login.btn_minha_conta.hover
       expect(page).to have_css 'a[href="/login?returnUrl=%2F"]'
   end

   Então("o produto será adicionado com sucesso {string} {string}") do |mensagem, quantidade|
      expect(carrinhocompras.first('.quantity > input').value).to have_text quantidade
      expect(page).to have_xpath '//h1[text()="Carrinho de compras"]'
      expect(page).to have_text mensagem
   end

   Então("a quantidade será atualizada com sucesso {string}") do |quantidade|
      expect(carrinhocompras.first('.quantity > input').value).to have_text quantidade
   end   
    
   Então("o carrinho será limpo com sucesso") do
      expect(page).to have_text 'Seu carrinho de compras está vazio!'
   end

   Então("o cadastro será realizado com sucesso") do
      expect(page).to have_text 'CADASTRO CONCLUÍDO'
      expect(page).to have_text 'Olá, '+$nome_faker+', seu cadastro foi concluido com sucesso!'
   end

   Então("a proposta será enviada com sucesso") do
      expect(pedido_venda.lbl_status_email.text).to have_text 'Enviado'
   end

   Então("minha conta será acessada com sucesso") do
      expect(page).to have_text 'MEUS NEGÓCIOS'
      expect(page).to have_text 'Convidados'
      expect(page).to have_text 'Propostas'
      expect(page).to have_text 'SERVIÇOS & SOLUÇÕES'
      expect(page).to have_text 'Emissão 2º via de boleto'
      expect(page).to have_text 'Leasing e financiamento'
      expect(page).to have_text 'Central de atendimento'
      expect(page).to have_text 'Cloud solutions'
      expect(page).to have_text 'Meu cadastro'
      expect(page).to have_text 'Alterar senha'
      expect(page).to have_text 'Aviso de disponibilidade'
      expect(page).to have_text 'Comissões'
      expect(page).to have_text 'Encomendas'
      expect(page).to have_text 'FALE COM A SND'
      expect(page).to have_text 'Telefones úteis'
      expect(page).to have_text 'Dúvidas frequentes'
      expect(page).to have_text 'Fale Conosco'
      expect(page).to have_text '(11) 2187-8400'
      expect(page).to have_text 'DADOS DA REVENDA'
      expect(page).to have_text 'ecommerce@snd.com.br'
      expect(page).to have_text 'ENDEREÇO DE FATURAMENTO'
      expect(page).to have_text 'ENDEREÇO DE COBRANÇA'
      expect(page).to have_text 'ENDEREÇO DE ENTREGA'
   end   

   Então("a proposta será transformada em carrinho com sucesso") do
      expect(page).to have_text 'CARRINHO DE COMPRAS'
   end

   Então("o simulador de vendas será ativo com sucesso") do
      expect(simuladorvenda.lnk_simular_venda).to have_text 'Simulador Ativo'
   end

   Então("o simulador de vendas será cancelado com sucesso") do
      expect(simuladorvenda.lnk_simular_venda).to have_text 'Simulador de Venda'
   end

   Então("o preco do produto simulado estara de acordo com sua tabela de preco {string} {string} {string}") do |estado, consumo_revenda, contribuinte|
      expect(simuladorvenda.lnk_simular_venda).to have_text 'Simulador Ativo'
      simuladorvenda.formatar_preco_unit
      sqlserver.ler_preco_base(estado,consumo_revenda,contribuinte)
      puts 'preco_simul' + $preco_simulado
      puts 'preco_final' + $preco_final_tab
      expect($preco_simulado).to have_text $preco_final_tab
   end
   

   Então("a proposta será cancelada com sucesso") do
      expect(page).to have_text 'Mostrando de '
   end

   Então("a proposta será editada com sucesso") do
      expect(page).to have_text $nome
   end

   Então("a proposta será clonada com sucesso") do
      expect(page).to have_text $nome
   end

   Então("o pedido será gerado com sucesso") do
      expect(page).to have_text 'SEU PEDIDO FOI PROCESSADO COM SUCESSO!'
   end

   Então("a proposta será visualizada") do
      expect(page).to have_text 'PRINCIPAL'
      expect(page).to have_text 'CENTRO DE DISTRIBUIÇÃO'
      expect(page).to have_text 'OBSERVAÇÕES'
      expect(page).to have_css 'input[name="cancel"]'
      expect(page).to have_css 'input[name="editarproposta"]'
      expect(page).to have_css 'input[name="clonarproposta"]'
      expect(page).to have_css 'input[name="sendtocart"]'
      expect(page).to have_css  '#sendmail'
   end

   Então("a 2via do boleto será visualizada {string}") do |cnpj|
      within_window $janela do
          expect(page).to have_text 'Imprimir em impressora jato de tinta (ink jet) ou laser em qualidade normal. (Não use modo econômico).'
          expect(page).to have_text cnpj
      end
   end

   Então("a central de atendimento será visualizada") do
      expect(page).to have_text 'CENTRAL DE ATENDIMENTO'
      expect(page).to have_text 'ANTES DA COMPRA'
      expect(page).to have_text 'COMPRANDO'
      expect(page).to have_text 'APÓS A COMPRA'
      expect(page).to have_text 'FALE COM A SND'
   end

   Então("o convidado será editado com sucesso") do
      expect(page).to have_text CONFIG['email_guest']
   end

   Então("a tela do 2bcloud será visualizada") do
      expect(page).to have_css('img[src="https://mktsnd.blob.core.windows.net/snd/2bcloud_banners_site/banner1.png"]')
   end

   Então("o convidado será criado com sucesso") do
      expect(page).to have_text CONFIG['email_guest']
   end

   Então("o convidado será excluido com sucesso") do
      expect(page).to have_no_text CONFIG['email_guest']
   end

   E("validar o detalhe do pedido") do
      minhaconta.detalhe_pedido
   end

   Então("validar o pedido") do
      expect(page).to have_text 'Número de encomenda:'
      expect(page).to have_text 'Estado da encomenda:'
      expect(page).to have_text 'Data da encomenda:'
      expect(page).to have_text 'Total da encomenda:'
   end

   Então("o valor retonar para o valor da revenda") do
      expect(page).to have_text $preco_tabela
   end

   Então("a tela de leasing e financiamento será visualizada") do
      expect(page).to have_text 'LEASING E FINANCIAMENTO'
      expect(page).to have_text 'Quais são as linhas de financiamento da SND?'
   end
   

   Então("o link será validado com sucesso {string} {string}") do |grupo, link|
       if grupo == 'Todos os departamentos' then
            expect(home.descr_link.text).to have_text link
       end 

       if link == 'Ver mais..'
            link = 'LISTA DE FABRICANTES'
       end  
           expect(home.descr_filtro.text).to have_text link.upcase 
   end
     
   E("esperar") do
      sleep 1000000
   end