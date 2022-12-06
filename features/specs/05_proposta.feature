#language:pt
   @Regressivo_Novo_B2B
   @Proposta
   Funcionalidade: Pedido

      @EnviarPropostaEmail
      Esquema do Cenário: Enviar proposta por e-mail
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar proposta
         E salvar a proposta 
         Então a proposta será enviada com sucesso
      Exemplos:  
         | user                           | url                                                                                                   |                                                                                                                                        
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9                                     | 

      @TransformarPropostaCarrinho
      Esquema do Cenário: Transformar proposta em carrinho
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar proposta
         E transformar proposta em carrinho 
         Então a proposta será transformada em carrinho com sucesso
      Exemplos:  
         | user                           | url                                                                                                   |                                                                                                                                        
         | douglas.ferreira@snd.com.br    |  https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9                                    | 
         

      @CancelarPropostaCarrinho
      Esquema do Cenário: Cancelar proposta em carrinho
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar proposta
         E cancelar a proposta
         Então a proposta será cancelada com sucesso
      Exemplos:  
         | user                           | url                                                                                                   |                                                                                                                                        
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9                                     | 

      @EditarPropostaCarrinho
      Esquema do Cenário: Editar proposta em carrinho
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar proposta
         E editar a proposta
         Então a proposta será editada com sucesso
      Exemplos:  
         | user                           | url                                                                                                   |                                                                                                                                        
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9                                     | 

      @ClonarPropostaCarrinho
      Esquema do Cenário: Clonar proposta em carrinho
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar proposta
         E clonar a proposta
         Então a proposta será clonada com sucesso
      Exemplos:  
         | user                           | url                                                                                                   |                                                                                                                                        
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9                                     | 