class Login < SitePrism::Page
   set_url '/'
   #-------------------------------------------------------------------#
   #                         E L E M E N T O S                         #
   #-------------------------------------------------------------------#
   element :btn_minha_conta, :xpath,           '//label[text()="Minha Conta"]'
   element :btn_entrar_login,                  'a[href="/login?returnUrl=%2F"]'
   element :btn_sair_login,                    'a[href="/logout"]'
   element :ipt_email_login,                   '#Email'
   element :ipt_senha_login,                   '#Password'
   element :btn_entrar, :xpath,                '//button[text()="Entrar"]'
   element :btn_cookies_ok,                    '#eu-cookie-ok'
   element :btn_esqueci_minha_senha,           'a[href="/passwordrecovery"]'
   element :btn_recuperar, :xpath,             '//button[text()="Recuperar"]'
   element :btn_acessar_usuario,               'a[href="/customer/info"]'
   element :lnk_alterar_senha, :xpath,         '//a[text()=" Alterar senha "]'
   element :ipt_senha_antiga,                  '#OldPassword'
   element :ipt_senha_nova,                    '#NewPassword'
   element :ipt_confirmar_senha,               '#ConfirmNewPassword'
   element :btn_alterar_senha, :xpath,         '//button[text()="Alterar senha"]'

   #-------------------------------------------------------------------#
   #                           M É T O D O S                           #
   #-------------------------------------------------------------------#

   
    def cookies_ok
           btn_cookies_ok.click
    end    

    def logar
            btn_minha_conta.hover
            btn_entrar_login.click
            ipt_email_login.set CONFIG['user']
            ipt_senha_login.set CONFIG['pass_new']
            btn_entrar.click
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
end