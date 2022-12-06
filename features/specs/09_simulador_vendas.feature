#language:pt
   @Regressivo_Novo_B2B
   @SimuladorVendas
   Funcionalidade: Simulador
      
      Contexto: 
         Dado que o usuário acesse o novo B2B 
         E efetuar login com user e senha

      @AtivarSimulador
      Esquema do Cenário: Ativar simulador de venda
         Quando ativar simulador de vendas "<uf>" "<consumo>" "<contribuinte>"
         Então o simulador de vendas será ativo com sucesso
      Exemplos:  
         | uf     | consumo_revenda     | contribuinte     |
         | SP     | C                   | S                |
 
      @CancelarSimulador
      Esquema do Cenário: Cancelar simulador de venda
         Quando cancelar simulador de vendas
         Então o simulador de vendas será cancelado com sucesso
      Exemplos:  
         | uf     | consumo_revenda     | contribuinte     |
         | SP     | C                   | S                |
 
      @SimuladorEstados
      Esquema do Cenário: simular de vendas
         E efetuar a busca de "<produto>"
         E adicionar produto ao carrinho
         Quando ativar simulador de vendas "<uf>" "<consumo_revenda>" "<contribuinte>"
         Então o preco do produto simulado estara de acordo com sua tabela de preco "<uf>" "<consumo_revenda>" "<contribuinte>"
      Exemplos:  
         | uf     | consumo_revenda     | contribuinte     | produto            |
         | SP     | C                   | S                | E2270SWHEN S       |
         | SP     | R                   | N                | E2270SWHEN S       |
         | SP     | C                   | S                | E2270SWHEN S       |
         | RN     | C                   | S                | E2270SWHEN S       |
         | RN     | R                   | N                | E2270SWHEN S       |
         | RN     | C                   | S                | E2270SWHEN S       |
         | AM     | C                   | S                | E2270SWHEN S       |
         | AM     | R                   | N                | E2270SWHEN S       |
         | AM     | C                   | S                | E2270SWHEN S       |
         | RJ     | C                   | S                | E2270SWHEN S       |
         | RJ     | R                   | N                | E2270SWHEN S       |
         | RJ     | C                   | S                | E2270SWHEN S       |  
         | BA     | C                   | S                | E2270SWHEN S       |
         | BA     | R                   | N                | E2270SWHEN S       |
         | BA     | C                   | S                | E2270SWHEN S       |                 
         | SC     | C                   | S                | E2270SWHEN S       |
         | SC     | R                   | N                | E2270SWHEN S       |
         | SC     | C                   | S                | E2270SWHEN S       |           
         #simular venda para vários produtos