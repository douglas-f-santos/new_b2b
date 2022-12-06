#language:pt
   @Regressivo_Novo_B2B
   @CarrinhoCompras
   Funcionalidade: Carrinho de Compras

      @EfetuarbuscaProduto
      Esquema do Cenário: Efetuar busca do produto
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando efetuar a busca de "<produto>"
         Então será exibida a mensagem "<mensagem>"
      Exemplos:  
         | user                           | produto            | mensagem                                                                                      |     
         | douglas.ferreira@snd.com.br    | P5DA00741001FGM    | SACKBOY: A BIG ADVENTURE - PS5       |
 
      @AdicionarProdutoCarrinho
      Esquema do Cenário: Adicionar produto no carrinho de compras
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         E efetuar a busca de "<produto>"
         Quando adicionar produto ao carrinho
         Então o produto será adicionado com sucesso "<mensagem>" "<quantidade>"
      Exemplos:  
         | user                           | produto            | mensagem                             | quantidade      |       
         | douglas.ferreira@snd.com.br    | P5DA00741001FGM    | SACKBOY: A BIG ADVENTURE - PS5       | 1               |


      @AtualizarProdutoCarrinho
      Esquema do Cenário: Atualizar produto no carrinho de compras
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando atualizar quantidade do produto no carrinho "<quantidade>"
         Então a quantidade será atualizada com sucesso "<quantidade>"
      Exemplos:  
         | user                           | quantidade      |     
         | douglas.ferreira@snd.com.br    | 6               |
         
 
      @RemoverProdutoCarrinho
      Esquema do Cenário: Remover produto do carrinho de compras
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando remover produto do carrinho
         Então o carrinho será limpo com sucesso
      Exemplos:  
         | user                           |    
         | douglas.ferreira@snd.com.br    | 