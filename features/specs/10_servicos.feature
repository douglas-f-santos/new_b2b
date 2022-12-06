#language:pt
   @Regressivo_Novo_B2B
   @MinhaConta
   Funcionalidade: Minha Conta

      @AcessarMinhaConta
      Esquema do Cenário: Acessar minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando acessar a minha conta
         Então minha conta será acessada com sucesso
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    |

      @CriarNovoConvidado
      Esquema do Cenário: Criar um novo convidado
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando criar um novo convidado "<efetuar_compra>" "<acessar_comissoes>" "<visu_proprias_comissoes>" "<acessar_status_pedido>" "<visu_proprios_status>" "<criar_convidado>" "<limite_compra>" 
         Então o convidado será criado com sucesso
      Exemplos:  
         | user                           | efetuar_compra | acessar_comissoes | visu_proprias_comissoes | acessar_status_pedido | visu_proprios_status| criar_convidado | limite_compra  |
         | douglas.ferreira@snd.com.br    | sim            | sim               |  sim                    | sim                   | sim                 | sim             |  3             |
         | douglas.ferreira@snd.com.br    | sim            |                   |  sim                    |                       | sim                 |                 |  2             |
         | douglas.ferreira@snd.com.br    |                |                   |  sim                    |                       | sim                 |                 |  1             |
         | douglas.ferreira@snd.com.br    |                | sim               |  sim                    |                       |                     | sim             |  1             |
         | douglas.ferreira@snd.com.br    |                |                   |                         |                       |                     |                 |                |

      @EditarConvidado
      Esquema do Cenário: Editar o convidado
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando editar permissao de convidado "<efetuar_compra>" "<acessar_comissoes>" "<visu_proprias_comissoes>" "<acessar_status_pedido>" "<visu_proprios_status>" "<criar_convidado>" "<limite_compra>" 
         Então o convidado será editado com sucesso
      Exemplos:  
         | user                           | efetuar_compra | acessar_comissoes | visu_proprias_comissoes | acessar_status_pedido | visu_proprios_status| criar_convidado | limite_compra  |
         | douglas.ferreira@snd.com.br    | sim            | sim               |  sim                    | sim                   | sim                 | sim             |  3             |

      @ExcluirConvidado
      Esquema do Cenário: Excluir o convidado
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando excluir um convidado
         Então o convidado será excluido com sucesso
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 

#verificar se é possivel automatizar após a integração estiver ok
   #   @ValidarPermissaoConvidado
   #   Esquema do Cenário: Verificar as permissões do convidado
   #       Dado que o usuário acesse o novo B2B 
   #       E efetuar login com "<user>" e senha
   #       E acessar a minha conta
   #       Quando excluir um convidado
   #       Então o convidado será excluido com sucesso
   #    Exemplos:  
   #       | user                           | 
   #       | douglas.ferreira@snd.com.br    | 

     @VisualizarPropostaMinhaConta
     Esquema do Cenário: Visualizar proposta na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando visualizar a proposta
         Então a proposta será visualizada
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 


     @Acessar2viaBol
     Esquema do Cenário: Acessar 2via de boleto na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar 2via de boleto "<cnpj>" "<pedido>"
         Então a 2via do boleto será visualizada "<cnpj>"
      Exemplos:  
         | user                           | cnpj                  | pedido           |   
         | douglas.ferreira@snd.com.br    | 16.765.165/0001-94    | 6078494          |     
         | douglas.ferreira@snd.com.br    | 03.506.119/0001-29    | 6078484          |     

     @AcessarLeasingFinan
     Esquema do Cenário: Acessar leasing e finanças na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar leasing e financiamento
         Então a tela de leasing e financiamento será visualizada
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 

     @AcessarCentralAtendimento
     Esquema do Cenário: Acessar central de atendimento na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar central de atendimento
         Então a central de atendimento será visualizada
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 

     @Acessar2bcloud
     Esquema do Cenário: Acessar 2bcloud na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar 2bcloud
         Então a tela do 2bcloud será visualizada
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 


     @AcessarCadastro
     Esquema do Cenário: Acessar cadastro na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar cadastro
         Então minha conta será acessada com sucesso
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 

     @AcessarAltSenha
     Esquema do Cenário: Acessar alterar senha na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar alterar senha
         Então será exibida a mensagem "<mensagem>"
      Exemplos:  
         | user                           | mensagem                                      | 
         | douglas.ferreira@snd.com.br    | Senha foi alterada                            |
         
     @AcessarDisponibilidade
     Esquema do Cenário: Acessar disponibilidade na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar disponibilidade
         Então a disponibilidade será visualizada
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 

     @PequisarComissao
     Esquema do Cenário: Acessar comissao na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar comissao "<data_inicio>" "<data_fim>" "<status>" "<comissao>" "<idpedido>"
         # Incluir massa de dados
         # Então a proposta será visualizada
      Exemplos:  
         | user                          | data_inicio     | data_fim     | status         | comissao           | idpedido     | 
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Disponível     | Comissão SND       |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Quitado        | Comissão SND       |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Cancelado      | Comissão SND       |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Previsto       | Comissão SND       |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Solicitado     | Comissão SND       |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Disponível     | Comissão FSRental  |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Quitado        | Comissão FSRental  |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Cancelado      | Comissão FSRental  |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Previsto       | Comissão FSRental  |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Solicitado     | Comissão FSRental  |              |
         | douglas.ferreira@snd.com.br   | 01/01/2021      | 24/10/2022   | Solicitado     | Comissão FSRental  |              |
         | douglas.ferreira@snd.com.br   |                 |              |                |                    | 123456       |
    
    
    @AcessarPedido
     Esquema do Cenário: Acessar pedido na minha conta
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a minha conta
         Quando acessar pedido
         E esperar
         Então validar o pedido
         #BUG - TBM CONSTRUIR O FINAL DA VALIDAÇÃO
         E validar o detalhe do pedido
      Exemplos:  
         | user                           | 
         | douglas.ferreira@snd.com.br    | 