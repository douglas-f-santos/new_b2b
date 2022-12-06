#language:pt
   @Regressivo_Novo_B2B
   @Pedido
   @gravar_dados
   Funcionalidade: Pedido

      @PedidoProdutoeServico @reg
      Esquema do Cenário: Gerar pedido de venda
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto e adicionar produto "<url1>" "<url2>"
         Quando gerar pedido com condicao de pagamento "<opcoes_pagamento>" "<tipo_fat>" "<tipo_uso>" "<prod_servico>"
         Então o pedido será gerado com sucesso
      Exemplos:  
         | user                           | url1                                                                     | url2                                                    | opcoes_pagamento       | tipo_fat      | tipo_uso             | prod_servico                                    |                                                                                                                                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9        | https://qa.snd.com.br/nobreak-station-ii-600-bivolt     | BNDES                  | empresa       | uso_consumo          | Produto e Serviço                               |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/teclado-para-jogos-logitech-g413-abnt2             | https://qa.snd.com.br/nobreak-station-ii-600-bivolt     | BNDES                  | empresa       | uso_consumo          | Produtos Centro de Distribuição diferentes      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/apresentador-sem-fio-r400-logitech                 | https://qa.snd.com.br/nobreak-station-ii-600-bivolt     | BNDES                  | empresa       | uso_consumo          | Produtos Centro de Distribuição diferentes      |


      @PedidoVenda @reg
      Esquema do Cenário: Gerar pedido de venda
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar pedido com condicao de pagamento "<opcoes_pagamento>" "<tipo_fat>" "<tipo_uso>" "<prod_servico>"
         Então o pedido será gerado com sucesso
      Exemplos:  
         | user                           | url                                                                     | opcoes_pagamento       | tipo_fat      | tipo_uso             | prod_servico |                                                                                                                                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | BNDES                  | empresa       | uso_consumo          | Serviço      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | empresa       | comercializacao      | Serviço      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | cliente       | n_cadastrado         | Serviço      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Deposito bancário      | cliente       | cadastrado           | Serviço      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | BNDES                  | empresa       | uso_consumo          | Produto      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | empresa       | comercializacao      | Produto      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Boleto Santander       | cliente       | n_cadastrado         | Produto      |
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | Deposito bancário      | cliente       | cadastrado           | Produto      |

      @PedidoVendaFaturado @reg
      Esquema do Cenário: Gerar pedido de venda faturado com condições de pagamento
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar pedido com condicao de pagamento "Faturado" "<cond_pagto>" "<tipo_fat>" "<tipo_uso>" "<prod_servico>"
         Então o pedido será gerado com sucesso
      Exemplos:  
          | user                           | url                                                                     | cond_pagto      | tipo_fat      | tipo_uso             | prod_servico |                                                                                                                                 
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 14 dias         | empresa       | uso_consumo          | Serviço      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 21 dias         | empresa       | comercializacao      | Serviço      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 28 dias         | cliente       | cadastrado           | Serviço      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 28 dias         | cliente       | n_cadastrado         | Serviço      |  
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 21/28/35        | empresa       | uso_consumo          | Serviço      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 15/35 DDL       | empresa       | comercializacao      | Serviço      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | 45 dias         | cliente       | n_cadastrado         | Serviço      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 14 dias         | empresa       | uso_consumo          | Produto      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 21 dias         | empresa       | comercializacao      | Produto      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 28 dias         | cliente       | cadastrado           | Produto      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 28 dias         | cliente       | n_cadastrado         | Produto      |  
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 21/28/35        | empresa       | uso_consumo          | Produto      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 15/35 DDL       | empresa       | comercializacao      | Produto      |
          | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | 45 dias         | cliente       | n_cadastrado         | Produto      |

      @PedidoVendaPagSeguro
      Esquema do Cenário: Gerar pedido de venda de Pagseguro
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E acessar a pagina do produto "<url>"
         Quando gerar pedido com condicao de pagamento "<opcoes_pagamento>" "<numero_cartao>" "<cod>" "<data_exp>" "<parcelas>" "<tipo_fat>" "<tipo_uso>" "<prod_servico>"
         Então o pedido será gerado com sucesso
      Exemplos:  
         | user                           | url                                                                     | opcoes_pagamento       | numero_cartao          |   cod     | data_exp  | parcelas  | tipo_fat      | tipo_uso        | prod_servico   |                                                                                                                                                          
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 1         | empresa       | uso_consumo     | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 2         | empresa       | comercializacao | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 3         | cliente       | n_cadastrado    | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 4         | empresa       | uso_consumo     | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 7         | empresa       | uso_consumo     | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 8         | empresa       | comercializacao | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 11        | cliente       | n_cadastrado    | Serviço        |                  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/microsoft-windows-10-professional-64-bits-9       | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 12        | empresa       | uso_consumo     | Serviço        |                   
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 1         | empresa       | uso_consumo     | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 2         | empresa       | comercializacao | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 3         | cliente       | n_cadastrado    | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 4         | empresa       | uso_consumo     | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 7         | empresa       | uso_consumo     | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 8         | empresa       | comercializacao | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 11        | cliente       | n_cadastrado    | Produto        |  
         | douglas.ferreira@snd.com.br    | https://qa.snd.com.br/nobreak-station-ii-600-bivolt                     | PagSeguro              | 4539-6206-5992-2097    |   123     | 12/2026   | 12        | empresa       | uso_consumo     | Produto        |  



       