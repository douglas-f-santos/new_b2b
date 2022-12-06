#language:pt
   @Regressivo_Novo_B2B
   @Login
   Funcionalidade: Logar no novo B2B

     @EfetuarLoginSucesso
      Esquema do Cenário: Realizar login no novo B2B
         Dado que o usuário acesse o novo B2B 
         Quando efetuar login com "<user>" e senha
         Então será realizado o login com sucesso "<mensagem>"
      Exemplos:  
         | user                           | mensagem                                                                                                            |     
         | douglas.ferreira@snd.com.br    | Douglas Ferreira                                                                                                    |

      @EfetuarLoginErro
      Esquema do Cenário: Realizar login com dados incorretos no novo B2B
         Dado que o usuário acesse o novo B2B 
         Quando efetuar login com "<user>" e "<pass>"
         Então será exibida a mensagem "<mensagem>"
      Exemplos:  
         | user                           | pass               |  mensagem                                                                                                              |     
         | email.incorreto@snd.com.br     | SenhaCorreta       |  Login não teve sucesso. Por favor, corrija os erros e tente novamente.\nAs credenciais fornecidas não estão corretas. |
         | douglas.ferreira@snd.com.br    | SenhaIncorreta     |  Login não teve sucesso. Por favor, corrija os erros e tente novamente.\nAs credenciais fornecidas não estão corretas. |
         | email.incorreto@snd.com.br     | SenhaIncorreta     |  Login não teve sucesso. Por favor, corrija os erros e tente novamente.\nAs credenciais fornecidas não estão corretas. |
         |                                | SenhaCorreta       |  Por favor, insira o seu e-mail                                                                                        |
         | douglas.ferreira@snd.com.br    |                    |  Login não teve sucesso. Por favor, corrija os erros e tente novamente.\nAs credenciais fornecidas não estão corretas. |

      @EfetuarLogout
      Esquema do Cenário: Realizar logout no novo B2B
         Dado que o usuário acesse o novo B2B 
         Quando efetuar login com "<user>" e senha
         E deslogar do sistema
         Então o logout será realizado com sucessso
      Exemplos:  
         | user                           | pass               | 
         | douglas.ferreira@snd.com.br    | D12m02             | 

      @EsqueciSenha
      Esquema do Cenário: Recuperar a senha esquecida
         Dado que o usuário acesse o novo B2B 
         E entrar em esquecer minha senha
         Quando recuperar senha com "<user>"
         Então será exibida a mensagem "<mensagem>"
      Exemplos:  
         | user                           | mensagem                                                                                   | 
         | douglas.ferreira@snd.com.br    | Enviamos um email com as instruções para recuperar senha. Verifique sua caixa de email.    | 


      @AlterarLogin
      Esquema do Cenário: Alterar senha do usuário no novo B2B
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando alterar a senha do usuário
         Então será exibida a mensagem "<mensagem>"
      Exemplos:  
         | user                           | mensagem                                      |     
         | douglas.ferreira@snd.com.br    | Senha foi alterada                            |