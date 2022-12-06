#language:pt
   @Regressivo_Novo_B2B
   @Cadastro
   @gravar_dados
   Funcionalidade: Cadastro

      @CadastrarRevenda
      Esquema do Cenário: Cadastrar revenda
         Dado que o usuário acesse o novo B2B 
         Quando cadastrar revenda "<user>" "<inscr_mun>" "<suframa>" "<simples_nac>" "<anexo>" "<inscr_estadual>" "<website>" "<email_nfe>" "<compl_cob>" "<compl_ent>" "<compl_fat>" "<msm_end_ent>" "<msm_end_fat>"
         Então o cadastro será realizado com sucesso 
      Exemplos:  
         | user                           |  inscr_mun  | suframa       |  simples_nac | anexo  | inscr_estadual    | website    | email_nfe  | compl_cob | compl_ent | compl_fat | msm_end_ent  | msm_end_fat     |    
         | douglas.ferreira@snd.com.br    |             |               |              |        |                   |            |            |           |           |           |              |                 |    
         | douglas.ferreira@snd.com.br    |  sim        | sim           |  sim         | sim    | sim               | sim        | sim        | sim       | sim       | sim       | sim          | sim             |    
         | douglas.ferreira@snd.com.br    |  sim        |               |  sim         |        | sim               |            | sim        | sim       |           |           | sim          |                 |    
         | douglas.ferreira@snd.com.br    |  sim        | sim           |              |        | sim               | sim        |            | sim       | sim       | sim       |              |                 |    
         | douglas.ferreira@snd.com.br    |             |               |              |        |                   |            |            |           |           |           | sim          | sim             |    
         | douglas.ferreira@snd.com.br    |             |               | sim          |        |                   | sim        |            |           |           |           |              | sim             |    
         | douglas.ferreira@snd.com.br    |             |               |              |        |                   |            |            |           |           |           | sim          |                 |    
         
   #    @LoginRevenda
   #    Esquema do Cenário: Efetuar login de revenda cadastrada
   #       Dado que o usuário acesse o novo B2B 
   #       Quando cadastrar revenda "<user>"
   #       Então o cadastro será realizado com sucesso 
   #   Exemplos:  
   #       | user                           | 
   #       | douglas.ferreira@snd.com.br    | 
