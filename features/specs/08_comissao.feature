#language:pt
   @Regressivo_Novo_B2B
   @Comissao
   Funcionalidade: Comissao

      @ComissaoVendedor
      Esquema do Cenário: Gerar comissao de venda
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar pedido com comissao "<opcoes_pagamento>" "<tipo_fat>" "<tipo_uso>" "<percent>" "<prod_servico>"
         Então o pedido será gerado com sucesso
      Exemplos:  
         | user                           | url                                                                     | opcoes_pagamento       | tipo_fat      | tipo_uso             | percent   | prod_servico     |                                                                                                                         
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Deposito bancário      | cliente       | cadastrado           | 30.00     |                  |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | cliente       | n_cadastrado         | 20.00     |                  |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Deposito bancário      | cliente       | cadastrado           | 1000.00   |                  |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | BNDES                  | cliente       | n_cadastrado         | 100       |                  |
         #verificar se não tem limite dos preços para o cliente                 
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | BNDES                  | cliente       | cadastrado           | 30.00     |                  |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | cliente       | cadastrado           | 20.00     |                  |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | cliente       | n_cadastrado         | 50.00     |                  |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Deposito bancário      | cliente       | cadastrado           | 70.00     |                  |



      @ComissaoNegativa
      Esquema do Cenário: Valor de venda para o cliente menor que valor da revenda
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar pedido com comissao negativa "<opcoes_pagamento>" "<tipo_fat>" "<tipo_uso>" "<percent>" "<prod_servico>"
         Então o valor retonar para o valor da revenda
      Exemplos:  
         | user                           | url                                                                     | opcoes_pagamento       | tipo_fat      | tipo_uso             | percent     |  prod_servico     |                                                                                                                          
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Deposito bancário      | cliente       | cadastrado           | 00.10       |                   |  
 