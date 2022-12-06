class MinhaConta < SitePrism::Page
   #-------------------------------------------------------------------#
   #                         E L E M E N T O S                         #
   #-------------------------------------------------------------------#
   element :lnk_acessar_convidados,           'a[href="/servicos/Guest"]'
   element :lnk_criar_convidados,             'a[href="/Servicos/CreateGuest"]'
   element :ipt_nome_con,                     '#Nome'
   element :ipt_email_con,                    '#Username'
   element :ipt_senha_con,                    '#Senha'
   element :ipt_conf_senha_con,               '#ConfirmeSenha'
   element :btn_criar_usuario,                'input[value="Criar usuário"]'
   element :chk_efetuar_compra,               '#PodeEfetuarCompra'
   element :chk_acessar_comissoes,            '#PodeAcessarComissoes'
   element :chk_visu_proprias_comissoes,      '#VisualizarSomentePropriasComissoes'
   element :chk_acessar_status_pedido,        '#PodeAcessarStatusDePedido'
   element :chk_visu_proprios_status,         '#VisualizarSomentePropriosStatus'
   element :chk_criar_convidado,              '#PodeCriarConvidado'
   element :ipt_limite_compra,                '#LimiteDeCompra' 
   elements :lista_convidados,                'tr > td'
   element :btn_confirmar_exclusao,           'input[value="Excluir"]' 
   element :btn_salvar_alteracoes,            'input[value="Salvar alterações"]'
   element :lnk_acessar_proposta,             'a[href="/Proposal/List"]'
   element :lnk_acessar_2via_bol,             '#btnSegundaViaDocumentos'
   element :lnk_acessar_lea_finan,            'a[href="https://qa.snd.com.br/leasing-e-financiamento"]'
   element :lnk_acessar_central,              'a[href="https://qa.snd.com.br/central-de-atendimento-3"]'
   element :lnk_acessar_2bcloud,              'a[href="https://qa.snd.com.br/2bcloud-2"]'
   element :lnk_acessar_cadastro,             'a[href="/servicos/MyProfile"]'
   element :lnk_acessar_alt_senha,            'a[href="/customer/changepassword"]'
   element :lnk_acessar_disponib,             'a[href="https://qa.snd.com.br/backinstocksubscriptions/manage"]'
   element :lnk_acessar_comissao,             'a[href="/servicos/Comissao"]'
   element :lnk_acessar_pedidos,              'a[href="https://qa.snd.com.br/Servicos/MeusPedidos"]'
   element :ipt_cnpj_2via,                    '#txtCnpj'
   element :ipt_num_pedido,                   '#orderId'
   element :btn_enviar,                       '#enviar'
   element :btn_acessar_2bcloud,              'area[href="https://desenvolvimento.snd.com.br/CSP/Redirect"]'
   element :ipt_data_inicio_comissao,         '#DataInicio'
   element :ipt_data_fim_comissao,            '#DataFim'
   element :cbx_status_comissao,              '#IdStatus'
   element :cbx_empresa_comissao,             '#IdComissao'
   element :btn_pequisar_comissao,            'input[value="Pesquisar"]'
   element :ipt_idpedido_comissao,            '#IdPedido'
   #-------------------------------------------------------------------#
   #                           M É T O D O S                           #
   #-------------------------------------------------------------------#
    def acessar_convidado
           lnk_acessar_convidados.click
    end    

    def criar_convidado
           lnk_criar_convidados.click
    end    

    def preencher_dados_convidado
           $nome_faker =  FFaker::Name.name 
           $email_faker = FFaker::Internet.email
           pass_new = Faker::Internet.password(min_length: 6, max_length: 10) 
           $pass = pass_new + '4@Aa'
           CONFIG['email_guest'] = $email_faker
           CONFIG['pass_guest'] = $pass

           File.write("./features/support/ambientes/12_1_27_BD.yml", CONFIG.to_yaml)

           ipt_nome_con.set $nome_faker    
           ipt_email_con.set $email_faker
           ipt_senha_con.set $pass   
           ipt_conf_senha_con.set $pass
    end  

    def permissao_usuario(efetuar_compra,acessar_comissoes,visu_proprias_comissoes,acessar_status_pedido,visu_proprios_status,criar_convidado,limite_compra)
           $efetuar_compra = efetuar_compra 
           $acessar_comissoes = acessar_comissoes 
           $visu_proprias_comissoes = visu_proprias_comissoes 
           $acessar_status_pedido = acessar_status_pedido 
           $visu_proprios_status = visu_proprios_status 
           $criar_convidado = criar_convidado 
       
           if efetuar_compra == 'sim' then
                 $limite_compra = limite_compra
                 chk_efetuar_compra.click
                 ipt_limite_compra.set limite_compra   
           end
           
           if acessar_comissoes  == 'sim' then
                 chk_acessar_comissoes.click  
           end                    
           
           if visu_proprias_comissoes  == 'sim' then
                chk_visu_proprias_comissoes.click   
           end                            
           
           if acessar_status_pedido  == 'sim' then
                chk_acessar_status_pedido.click 
           end             
           
           if visu_proprios_status  == 'sim' then
                chk_visu_proprios_status.click 
           end                              
           
           if criar_convidado  == 'sim' then
              chk_criar_convidado.click 
           end                              
    end   

    def criar_usuario   
           btn_criar_usuario.click
    end

    def logar_com_user(user)
           btn_minha_conta.hover
           btn_entrar_login.click
           ipt_email_login.set user
           ipt_senha_login.set CONFIG['pass_new']
           btn_entrar.click
    end   

    def logar_com_user_senha(user,pass)
           btn_minha_conta.hover
           btn_entrar_login.click
           ipt_email_login.set user
           
           if pass == "SenhaCorreta" then
                  ipt_senha_login.set CONFIG['pass_new']
           else
                  ipt_senha_login.set pass   
           end   
           
           btn_entrar.click
    end   

    def preencher_email(user)
           ipt_email_login.set user
           btn_recuperar.click
    end   
    

    def minha_conta
           btn_minha_conta.hover
    end

    def acessar_conta
           btn_acessar_usuario.click
    end
    
    def logout
           btn_minha_conta.hover
           btn_sair_login.click
    end   
    
    def esqueci_minha_senha
           btn_minha_conta.hover
           btn_entrar_login.click
           btn_esqueci_minha_senha.click
    end   

    def acessar_usuario
           btn_minha_conta.hover
           btn_acessar_usuario.click
    end 
    
    def alterar_senha
           lnk_alterar_senha.click
    end

    def preencher_nova_senha
           ipt_senha_antiga.set CONFIG['pass_new']
           pass_new = Faker::Internet.password(min_length: 6, max_length: 10) 
           pass = pass_new + '4@Aa'
           CONFIG['pass_new'] = pass
           File.write("./features/support/ambientes/12_1_27_BD.yml", CONFIG.to_yaml)
           ipt_senha_nova.set pass
           ipt_confirmar_senha.set pass
           btn_alterar_senha.click
    end   

    def buscar_user_delete
           email = CONFIG['email_guest']
           i = 1
           j = 1
           qtd = lista_convidados.length
              while i < 99  do
                 if lista_convidados[i].text == email then
                       find('tr:nth-child('+j.to_s+') > td:nth-child(3) > a.link-vermelho.link-excluir').click
                         if page.has_css?('input[value="'+email+'"]') then
                              btn_confirmar_exclusao.click
                         end    
                 end          
                 j +=1 
                 i +=3
              end
    end

    def buscar_user_editar
           $email = CONFIG['email_guest']
           i = 1
           j = 1
           qtd = lista_convidados.length
              while i < qtd  do
                 if lista_convidados[i].text == $email then
                      find('tr:nth-child('+j.to_s+') > td:nth-child(3) > a.link-azul-escuro.link-editar').click
 
                 end          
              j +=1 
              i +=3
              end
    end

    def salvar_edicao
           if page.has_css?('input[value="'+$email+'"]') then
                 btn_salvar_alteracoes.click
           end    
    end
    
    def acessar_propostas
           lnk_acessar_proposta.click
    end   

    def visualizar_propostas
           first('#visualizar').click
    end   

    def acessar_2via_bol
          lnk_acessar_2via_bol.click
    end   

    def acessar_leasing_finan
           lnk_acessar_lea_finan.click     
    end   

    def acessar_central_atendimento
           lnk_acessar_central.click
    end   

    def acessar_2bcloud
           lnk_acessar_2bcloud.click
    end   

    def acessar_cadastro
           lnk_acessar_cadastro.click
    end   

    def acessar_alt_senha
           lnk_acessar_alt_senha.click
    end   
    
    def acessar_disponib
           lnk_acessar_disponib.click
    end   

    def acessar_comissao
           lnk_acessar_comissao.click
    end   

    def pesquisar_comissao(data_inicio, data_fim, status, comissao,idpedido)
          if idpedido == '' then
               case status
                     when 'Disponível'
                         value_status = 1
                     when 'Quitado' 
                         value_status = 2
                     when 'Cancelado' 
                         value_status = 3
                     when 'Previsto' 
                         value_status = 4
                     when 'Solicitado' 
                         value_status = 5
                end         

                case comissao
                     when 'Comissão SND'
                          value_emp = 1
                     when 'Comissão FSRental'
                          value_emp = 2
                end          

                     ipt_data_inicio_comissao.set data_inicio        
                     ipt_data_fim_comissao.set    data_fim        
                     find('#IdStatus > option[value="'+value_status.to_s+'"]').select_option
                     find('#IdComissao > option[value="'+value_emp.to_s+'"]').select_option
                     btn_pequisar_comissao.click
          else           
              ipt_idpedido_comissao.set idpedido
          end    
    end

    def acessar_pedido
           lnk_acessar_pedidos.click
    end   

    def preencher_dados_2via_bol(cnpj,pedido)
            ipt_cnpj_2via.set cnpj
            ipt_num_pedido.set pedido

            $janela = window_opened_by do
               btn_enviar.click
            end
    end   

    def detalhe_pedido
          first(:xpath,'//button[text()="Detalhes"]').click
    end    

    def gravar_dados_convidado
           $execucao.push("#{$nome_faker}#{';'}#{$email_faker}#{';'}#{$pass}#{';'}#{$efetuar_compra}#{';'}#{$acessar_comissoes}#{';'}#{$visu_proprias_comissoes}#{';'}#{$acessar_status_pedido}#{';'}#{$visu_proprios_status}#{';'}#{$criar_convidado}#{';'}#{$limite_compra}#{';'}#{$data_hora}")
     
           f = File.new("features/support/convidados_novob2b/convidados.txt", "a+")
     
           $execucao.each { |line| f.puts(line) }
     
           f.close
     
           $execucao = []
    end 

end    
