class Cadastro < SitePrism::Page
   #-------------------------------------------------------------------#
   #                         E L E M E N T O S                         #
   #-------------------------------------------------------------------#
   element :btn_minha_conta, :xpath,              '//label[text()="Minha Conta"]'
   element :btn_cadastrar, :xpath,                '//a[text()="Cadastre-se"]'
   element :ipt_cnpj,                             '#customer_attribute_1'
   element :btn_proximo, :xpath,                  '//button[text()="próximo"]'
   element :btn_confirmar, :xpath,                '//button[text()="confirmar"]'
   element :ipt_razao_social,                     '#customer_attribute_6'
   element :ipt_nome_fantasia,                    '#Company'
   element :ipt_inscr_estadual,                   '#customer_attribute_7' 
   element :chk_isento,                           '#customer_attribute_24_10'  
   element :ipt_inscr_municipal,                  '#customer_attribute_8'
   element :ipt_suframa,                          '#customer_attribute_9'
   element :ipt_website,                          '#customer_attribute_10'
   element :chk_simples_nac,                      '#customer_attribute_16_9'
   element :ipt_email_nfe,                        '#customer_attribute_11'
   element :ipt_cep,                              '#ZipPostalCode'
   element :ipt_numero,                           'input[name="cobrancaNumero"]'
   element :ipt_end_ent_razao,                    'input[name="shippingFirstName"]'
   element :ipt_end_ent_telefone,                 'input[name="shippingTelefone"]'
   element :ipt_end_ent_cep,                      'input[name="shippingZipPostalCode"]'
   element :ipt_end_ent_numero,                   'input[name="shippingNumero"]'
   element :ipt_end_fat_razao,                    'input[name="faturamentoFirstName"]'
   element :ipt_end_fat_telefone,                 'input[name="faturamentoTelefone"]'
   element :ipt_end_fat_cep,                      'input[name="faturamentoZipPostalCode"]'
   element :ipt_end_fat_numero,                   'input[name="faturamentoNumero"]'
   element :ipt_email,                            '#Email'
   element :ipt_senha,                            '#Password'
   element :ipt_conf_senha,                       '#ConfirmPassword'
   element :ipt_nome,                             '#FirstName'
   element :ipt_departamento,                     '#customer_attribute_5'
   element :ipt_cargo,                            '#customer_attribute_13'
   element :ipt_telefone,                         '#Phone'
   element :ipt_telefone2,                        '#customer_attribute_14'
   element :ipt_celular,                          '#customer_attribute_15'
   element :ipt_email_cli,                        '#CustomSNDLoginModel_Email'
   element :ipt_cep_cli,                          '#CustomAddressModel_ZipPostalCode'
   element :ipt_ativar_cad_cli,                   '#cadastro-fat-ativar-simulacao'
   element :ipt_compl_cob,                        'input[name="cobrancaComplemento"]'
   element :ipt_compl_ent,                        'input[name="shippingComplemento"]'
   element :ipt_compl_fat,                        'input[name="faturamentoComplemento"]'
   element :chk_mesmo_end_ent,                    'input[name="sameShipping"]'
   element :chk_mesmo_end_fat,                    'input[name="sameFaturamento"]'
   #-------------------------------------------------------------------#
   #                           M É T O D O S                           #
   #-------------------------------------------------------------------#
    def cadastar_revenda
          btn_minha_conta.hover
          btn_cadastrar.click
    end    

    def preencher_cadastro(user, inscr_mun, suframa, simples_nac, anexo,inscr_estadual, website, email_nfe, compl_cob, compl_ent, compl_fat, msm_end_ent, msm_end_fat)
          generate = CpfCnpjTools::Generator.new
          @cnpj_revenda_faker = generate.generate_cnpj(formatted: true) 
          ipt_cnpj.set @cnpj_revenda_faker
          btn_proximo.click
          @empresa_faker =  FFaker::Company.name 
          $nome_faker =  FFaker::Name.name 
          dia_faker= FFaker::Number.number(digits: 1)
          mes_faker= FFaker::Number.number(digits: 1)
          ano_faker= FFaker::Number.number(digits: 1)
          inscr_estadual_faker = FFaker::Number.number(digits: 9)
          inscr_municipal_faker = FFaker::Number.number(digits: 11)
          suframa_faker = FFaker::Number.number(digits: 9)
          end_numero_faker= FFaker::Number.number(digits: 3)
          website_faker = FFaker::Internet.domain_name
          @email_nfe_faker = FFaker::Internet.email
          razao_social_faker = 'Razão Social ' + @empresa_faker
          nome_fantasia_faker = 'Nome Fantasia ' + @empresa_faker
          ipt_razao_social.set razao_social_faker
          ipt_nome_fantasia.set nome_fantasia_faker
          
          if inscr_estadual == 'sim' then
               ipt_inscr_estadual.set inscr_estadual_faker
          else
               chk_isento.click  
          end  
          
          if inscr_mun == 'sim' then
               ipt_inscr_municipal.set inscr_municipal_faker
          end   
          
          if suframa == 'sim' then
               ipt_suframa.set suframa_faker
          end   
               find('select[name="DateOfBirthDay"] > option[value="'+dia_faker.to_s+'"]').select_option
               find('select[name="DateOfBirthMonth"] > option[value="'+mes_faker.to_s+'"]').select_option
               find('select[name="DateOfBirthYear"] > option[value="199'+ano_faker.to_s+'"]').select_option

          if website == 'sim' then
               ipt_website.set website_faker
          end

          if email_nfe == 'sim' then
               ipt_email_nfe.set @email_nfe_faker
          end      
          
          if simples_nac == 'sim' then
               chk_simples_nac.click
          end   
              sleep 2
              btn_proximo.click
              sleep 2
          if page.has_css?('#ZipPostalCode') then
          end 

          ipt_cep.send_keys '064019'
          sleep 0.08
          page.send_keys '04'
          ipt_numero.set end_numero_faker

            
          if compl_cob == 'sim' then
               ipt_compl_cob.set 'Em frente as Lojas Renner'
          end   
          
          if msm_end_ent == 'sim' then
               chk_mesmo_end_ent.click
               sleep 2
               btn_proximo.click
               sleep 2
          
               if page.has_css?('input[name="shippingFirstName"]') then
          
               end 
          
          else  
               sleep 2
               btn_proximo.click 
               sleep 2
               if page.has_css?('input[name="shippingFirstName"]') then
          
               end 
          
               ipt_end_ent_razao.set razao_social_faker
               ipt_end_ent_telefone.set '11969986677'
               ipt_end_ent_cep.send_keys '064019'
               sleep 0.08
               page.send_keys '04'
               find('select[name="shippingStateProvinceId"] > option[value="183"]').select_option
               ipt_end_ent_numero.set end_numero_faker
               
               if compl_ent == 'sim' then
                    ipt_compl_ent.set 'Próximo ao Estádio Pompeu Sampaio'
               end
          end   
          
          if msm_end_fat == 'sim' then
                chk_mesmo_end_fat.click
                sleep 2
                btn_proximo.click
                sleep 2
                if page.has_css?('input[name="faturamentoFirstName"]') then

                end 
          else   
                sleep 2
                btn_proximo.click
                sleep 2
                if page.has_css?('input[name="faturamentoFirstName"]') then
  
                end 
                ipt_end_fat_razao.set razao_social_faker
                ipt_end_fat_telefone.set '11969986677'
                ipt_end_fat_cep.send_keys '064019'
                sleep 0.08
                page.send_keys '04'
                ipt_end_fat_numero.set end_numero_faker
                
                if compl_fat == 'sim' then
                      ipt_compl_fat.set 'Próximo ao metro morumbi'
                end 
          end
   
          sleep 2
          btn_proximo.click
          sleep 2
   
          if page.has_css?('#Email') then
   
          end 
   
          ipt_email.set @email_nfe_faker  
          ipt_senha.set CONFIG['pass_new']                        
          ipt_conf_senha.set CONFIG['pass_new']      
          ipt_nome.set $nome_faker                 
          ipt_departamento.set 'Marketing'                    
          ipt_cargo.set    'Analista de Marketing'              
          ipt_telefone.set  '011969986673'                        
          ipt_telefone2.set '011969986674'                        
          ipt_celular.set '011969985671' 
          btn_proximo.click  
          btn_confirmar.click        
          puts '----------------------------'
          puts 'empresa '+ @empresa_faker
          puts 'cnpj_revenda: ' + @cnpj_revenda_faker
          puts 'user: ' + @email_nfe_faker
          puts 'senha: '+ CONFIG['pass_new']
    end    

    def preencher_cadastro_cliente
            empresa =  FFaker::Company.name 
            $nome =  FFaker::Name.name 
            dia= FFaker::Number.number(digits: 1)
            mes= FFaker::Number.number(digits: 1)
            ano= FFaker::Number.number(digits: 1)
            inscr_estadual = FFaker::Number.number(digits: 9)
            inscr_municipal = FFaker::Number.number(digits: 11)
            suframa = FFaker::Number.number(digits: 9)
            end_numero= FFaker::Number.number(digits: 3)
            website = FFaker::Internet.domain_name
            @email_cli = FFaker::Internet.email
            @razao_social = 'Razão Social ' + empresa
            @nome_fantasia = 'Nome Fantasia ' + empresa
            ipt_razao_social.set @razao_social
            ipt_nome_fantasia.set @nome_fantasia
            ipt_inscr_estadual.set inscr_estadual
            ipt_email_cli.set @email_cli
            ipt_telefone.set  '011969986673'                        
            ipt_telefone2.set '011969986674' 
            ipt_celular.set '011969985671' 
            ipt_cep_cli.send_keys '064019' 
            sleep 0.08
            page.send_keys '04'
            ipt_numero.set end_numero
            sleep 4
            ipt_ativar_cad_cli.click
   
            if page.has_css?('button[onclick="CheckoutAddress.save()"]') then
   
            end 
      end 
      
      def gravar_dados_revenda
             senha = CONFIG['pass_new']
             $execucao.push("#{'Revenda'}#{';'}#{@empresa_faker}#{';'}#{@cnpj_revenda_faker}#{';'}#{@email_nfe_faker}#{';'}#{senha}#{';'}#{$data_hora}")
             f = File.new("features/support/clientes_novob2b/clientes.txt", "a+")
             $execucao.each { |line| f.puts(line) }
             f.close
             $execucao = []
      end 

      def gravar_dados_cliente
             senha = CONFIG['pass_new']
             $execucao.push("#{'Cliente da Revenda'}#{';'}#{$nome}#{';'}#{$cnpj_revenda}#{';'}#{@email_cli}#{';'}#{senha}#{';'}#{$data_hora}")
             f = File.new("features/support/clientes_novob2b/clientes.txt", "a+")
             $execucao.each { |line| f.puts(line) }
             f.close
             $execucao = []
      end 
end
