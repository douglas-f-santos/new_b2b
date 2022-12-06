require 'tiny_tds'

class QryCrmDados
    def initialize
         @username = 'promicro'
         @password = 'aquarela'
         @host = '192.168.6.165'
         @port = 1433
         @database = 'SND'
         @azure = false
         @util = Util.new
    end   

    def conn_crm
               @client = TinyTds::Client.new username: @username, password: @password, 
               host: @host, port: @port, database: @database, azure: @azure, timeout: 200
    end    

    def qry_dados_cliente(estab_origem,estado_cliente,cfop,revenda)
            if revenda == 'S' then
               @resultsrev = @client.execute("
               SELECT top 1
                  A.CodTerceiro 'CodRevenda',
                  CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
               FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
               WHERE 
                  a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                  a.eMail is not null and
                  a.Endereco is not null and
                  a.tipo in ('A','C') and 
                  a.Cgc is not null and 
                  a.codramoatividade = 4 and 
                  a.InscricaoEstadual <> 'isento' and 
                  a.codsituacao = 1 and 
                  a.tipopiramide IN (1,2,3) and
                  b.limitecredito > 1000000 and
                  b.limitecreditosndpay > 1000000 and
                  b.saldosndpay > 1000000 and
                  b.saldosndpayreal > 1000000
                  ORDER BY NEWID()   
                  ")

                  @resultsrev.each do |row|
                     $cod_revenda =  row["CodRevenda"]
                      puts  $cod_revenda
                  end
                  rev = $cod_revenda.nil?
      
                  if rev == true then
                      $cod_revenda = 'vazio'
                  end  
            end  

            if cfop == '6.102.1' then
               puts 'CFOP: 6.102.1'
               @results = @client.execute("
               SELECT top 1
                  A.CodTerceiro AS 'CodCliente', 	
                  CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                  A.CodTerceiro 'CodRevenda',
                  CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
               FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
               WHERE 
                  a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                  a.eMail is not null and
                  a.Endereco is not null and
                  a.Cgc is not null and
                  a.tipo in ('A','C') and  
                  a.codramoatividade =4 and 
                  a.siglaestado = '"+estado_cliente+"' and 
                  a.InscricaoEstadual <> 'isento' and 
                  a.codsituacao = 1 and 
                  a.tipopiramide IN (1,2,3) and
                  b.limitecredito > 6000000 and
                  b.limitecreditosndpay > 6000000 and
                  b.saldosndpay > 6000000 and
                  b.saldosndpayreal > 6000000 
                  ORDER BY NEWID()   
               ")  
            elsif cfop == '6.102.3' then
                  puts 'CFOP: 6.102.3'
                  @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE 
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.tipo in ('A','C') and 
                      a.Cgc is not null and 
                      a.codramoatividade = 4 and 
                      a.siglaestado = '"+estado_cliente+"' and 
                      a.InscricaoEstadual <> 'isento' and 
                      a.codsituacao = 1 and 
                      a.tipopiramide IN (1,2,3) and
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")

           elsif cfop == '6.102.10' then
                  puts 'CFOP: 6.102.10'
                  @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE 
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.Cgc is not null and
                      a.tipo in ('A','C') and  
                      a.codramoatividade =4 and 
                      a.siglaestado = '"+estado_cliente+"' and 
                      a.cnae in ('46.63-0/0','46.63-0/00','20.93-2/00','28.15-1/00','28.15-1/02','20.14-2/00','28.23-2/00','28.69-1/00','33.14-7/05','42.92-8/00','42.92-8/01','42.92-8/02','33.21-0/00',
                        '12.10-7/00') and
                      a.InscricaoEstadual <> 'isento' and 
                      a.codsituacao = 1 and 
                   -- a.tipopiramide IN (1,2,3) and
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")              

           elsif cfop == '6.102.11' then
                  puts 'CFOP: 6.102.11'
                  @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and 
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.Cgc is not null and
                      a.tipo in ('A','C') and  
                      a.codramoatividade = 4 and 
                      a.siglaestado = '"+estado_cliente+"' and
                      a.inscricaosuframa is not null and
                      a.cidade not in ('Tabatinga','Guajará-Mirim','Bonfim','Epitaciolândia', 'Epitaciolandia') and 
                      a.codsituacao = 1 and 
                   -- a.tipopiramide IN (1,2,3) and
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")                      

           elsif cfop == '6.102.83' then
                  puts 'CFOP: 6.102.83'
                  @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and 
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.Cgc is not null and
                      a.tipo in ('A','C') and  
                      a.codramoatividade = 4 and 
                      a.InscricaoEstadual <> 'isento' and
                      a.siglaestado = '"+estado_cliente+"' and
                      a.inscricaosuframa is not null and
                      a.cidade in ('Tabatinga','Guajará-Mirim','Bonfim','Epitaciolândia', 'Epitaciolândia', 'Epitaciolandia') and 
                      a.codsituacao = 1 and 
                   -- a.tipopiramide IN (1,2,3) and
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")    

           elsif cfop == '6.108.1' then
            puts 'CFOP: 6.108.1'
                  @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and 
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.Cgc is not null and
                      a.tipo in ('A','C') and  
                      a.codramoatividade = 4 and 
                      a.InscricaoEstadual = 'isento' and
                      a.siglaestado = '"+estado_cliente+"' and
                      a.codsituacao = 1 and 
                  -- a.tipopiramide IN (1,2,3) and
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")    

           elsif cfop == '6.108.3' then
                  puts 'CFOP: 6.108.3'
                  @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE 
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.Cgc is not null and
                      a.tipo in ('A','C') and  
                      a.codramoatividade = 4 and 
                      a.InscricaoEstadual = 'isento' and
                      a.siglaestado = '"+estado_cliente+"' and
                      a.codsituacao = 1 and 
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")    

           elsif cfop == '6.108.11' then
                 puts 'CFOP: 6.108.11'
                 @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE 
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.Cgc is not null and
                      a.tipo in ('A','C') and
                      a.inscricaosuframa is not null and  
                      a.cidade not in ('Tabatinga','Guajará-Mirim','Bonfim','Epitaciolândia', 'Epitaciolândia', 'Epitaciolandia') and 
                      a.codramoatividade = 4 and 
                      a.siglaestado = '"+estado_cliente+"' and
                      a.codsituacao = 1 and 
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                     ")    
     

           elsif cfop == '6.119.7' then
            puts 'CFOP: 6.119.7'
                  @results = @client.execute("
                  SELECT top 1
                     A.CodTerceiro AS 'CodCliente', 	
                     CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                     A.CodTerceiro 'CodRevenda',
                     CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                     FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                  WHERE 
                     a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                     a.eMail is not null and
                     a.Endereco is not null and
                     a.Cgc is not null and
                     a.tipo in ('A','C') and  
                     a.codramoatividade = 4 and 
                     a.InscricaoEstadual <> 'isento' and
                     a.siglaestado = '"+estado_cliente+"' and
                     a.codsituacao = 1 and 
                     b.limitecredito > 6000000 and
                     b.limitecreditosndpay > 6000000 and
                     b.saldosndpay > 6000000 and
                     b.saldosndpayreal > 6000000
                     ORDER BY NEWID()   
                      ")    
           elsif cfop == '6.119.84' then
                   puts 'CFOP: 6.119.84'
                   @results = @client.execute("
                   SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                   FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                   WHERE
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and 
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.tipo in ('A','C') and 
                      a.Cgc is not null and 
                      a.codramoatividade = 4 and 
                      a.InscricaoEstadual = 'isento' and
                      a.siglaestado = '"+estado_cliente+"' and
                      a.codsituacao = 1 and 
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                      ")  
           elsif cfop == '6.403.1' then
                  puts 'CFOP: 6.403.1'
                  @results = @client.execute("
                  SELECT top 1
                     A.CodTerceiro AS 'CodCliente', 	
                     CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                     A.CodTerceiro 'CodRevenda',
                     CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                  FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                  WHERE 
                     a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                     a.eMail is not null and
                     a.Endereco is not null and
                     a.tipo in ('A','C') and 
                     a.Cgc is not null and 
                     a.codramoatividade = 4 and 
                     a.siglaestado = '"+estado_cliente+"' and
                     a.codsituacao = 1 and 
                     b.limitecredito > 6000000 and
                     b.limitecreditosndpay > 6000000 and
                     b.saldosndpay > 6000000 and
                     b.saldosndpayreal > 6000000
                     ORDER BY NEWID()   
                     ")  
 
                elsif cfop == '6.933.2' then
                    puts 'CFOP: 6.933.2'
                    @results = @client.execute("
                    SELECT top 1
                      A.CodTerceiro AS 'CodCliente', 	
                      CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                      A.CodTerceiro 'CodRevenda',
                      CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                    FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro
                    WHERE
                      a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and 
                      a.eMail is not null and
                      a.Endereco is not null and
                      a.InscricaoEstadual = 'isento' and 
                      a.tipo in ('A','C') and 
                      a.Cgc is not null and 
                      a.codramoatividade = 4 and 
                      a.siglaestado = '"+estado_cliente+"' and
                      a.codsituacao = 1 and 
                      b.limitecredito > 6000000 and
                      b.limitecreditosndpay > 6000000 and
                      b.saldosndpay > 6000000 and
                      b.saldosndpayreal > 6000000
                      ORDER BY NEWID()   
                    ")  

                elsif cfop == '5.102.3' then
                       puts 'CFOP: 5.102.3'
                       @results = @client.execute("
                       SELECT top 1
                          A.CodTerceiro AS 'CodCliente', 	
                          CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                          A.CodTerceiro 'CodRevenda',
                          CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                        FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                        WHERE 
                          a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                          a.eMail is not null and
                          a.Endereco is not null and
                          a.tipo in ('A','C') and 
                          a.Cgc is not null and 
                          a.codramoatividade = 4 and 
                          a.siglaestado = '"+estado_cliente+"' and 
                          -- a.InscricaoEstadual <> 'isento' and 
                          a.codsituacao = 1 and 
                          a.tipopiramide IN (1,2,3) and
                          b.limitecredito > 6000000 and
                          b.limitecreditosndpay > 6000000 and
                          b.saldosndpay > 6000000 and
                          b.saldosndpayreal > 6000000
                          ORDER BY NEWID()   
                          ")
   
              elsif cfop == '5.102.1' then
                     puts 'CFOP: 5.102.1'
                     @results = @client.execute("
                      SELECT top 1
                         A.CodTerceiro AS 'CodCliente', 	
                         CONCAT ( '[', A.CodTerceiro, '] ', A.SiglaEstado, ' - ',A.Cidade,' - ',A.RazaoSocial ) AS 'NomeCliente',
                         A.CodTerceiro 'CodRevenda',
                         CONCAT('[', A.CodTerceiro, '] ', A.RazaoSocial) AS 'NomeRevenda'
                      FROM terceiro(nolock) A INNER JOIN terceirofaturamento(nolock) B on a.codterceiro = b.codterceiro 
                      WHERE 
                         a.CodTerceiro not in ('346679','113705','389074','137304','127711','361872','154184','111107') and
                         a.eMail is not null and
                         a.Endereco is not null and
                         a.Cgc is not null and
                         a.tipo in ('A','C') and  
                         a.codramoatividade =4 and 
                         a.siglaestado = '"+estado_cliente+"' and 
                         a.InscricaoEstadual <> 'isento' and 
                         a.codsituacao = 1 and 
                         a.tipopiramide IN (1,2,3) and
                         b.limitecredito > 6000000 and
                         b.limitecreditosndpay > 6000000 and
                         b.saldosndpay > 6000000 and
                         b.saldosndpayreal > 6000000 
                         ORDER BY NEWID()   
                       ")  
   
           end
           
                @results.each do |row|
                    $cod_cliente =  row["CodCliente"]
                    # $cod_cliente = '249343'
                    puts  $cod_cliente
                end
                cli = $cod_cliente.nil?
        
                if cli == true then
                    $cod_cliente = 'vazio'
                end  
    end 
    
    def qry_dados_material(estab_origem,estado_cliente,cfop)
        @util.dexpara_filial_prot(estab_origem)  
             if cfop == '6.102.3' or cfop == '6.102.1' or cfop == '6.102.10' or cfop == '6.102.11' or cfop == '6.102.83' or cfop =='6.108.1' or cfop =='6.108.3' or cfop =='6.108.11' or cfop == '6.933.2' or cfop =='5.102.1' or cfop =='5.102.3' then
                    @results_material = @client.execute("
                       SELECT top 1 B2_COD from totvs12.dbo.SB2010(nolock) SB2
                       INNER JOIN Totvs12.dbo.sb1010(nolock) SB1
                           ON SB2.B2_COD = SB1.b1_cod 
    				   INNER JOIN precomaterial_crm preco_crm
                           ON preco_crm.codmaterial = SB1.b1_cod 
                       WHERE SB2.B2_QATU > 9
                           AND SB2.B2_FILIAL = '"+$estabelecimento+"'
                           AND preco_crm.CodEstabelecimento = '"+estab_origem+"' 
                           AND SB1.b1_xrevisg = 'S'
                           AND preco_crm.datavalidadefim > getdate()
                           AND preco_crm.estado is not null
                           AND B2_COD not in (select DISTINCT CodMaterial from PrecoMaterial_ItemRebate(nolock))
                           AND B2_COD not in (select DISTINCT G1_COMP from totvs12.dbo.SG1010(nolock))
                           ORDER BY NEWID() 
                        ")
             elsif cfop == '6.403.1' then               
                   @results_material = @client.execute("
                    SELECT top 1 B2_COD from totvs12.dbo.SB2010(nolock) SB2
                    INNER JOIN Totvs12.dbo.sb1010(nolock) SB1
                        ON SB2.B2_COD = SB1.b1_cod 
                    INNER JOIN precomaterial_crm preco_crm
                        ON preco_crm.codmaterial = SB1.b1_cod 
                    WHERE SB2.B2_QATU > 9
                        AND SB2.B2_FILIAL = '"+$estabelecimento+"'
                        AND preco_crm.CodEstabelecimento = '"+estab_origem+"' 
                        AND SB1.b1_xrevisg = 'S'
                        AND preco_crm.datavalidadefim > getdate()
                        AND preco_crm.estado is not null
                        AND B2_COD not in (select DISTINCT CodMaterial from PrecoMaterial_ItemRebate(nolock))
                        AND B2_COD not in (select DISTINCT G1_COMP from totvs12.dbo.SG1010(nolock))
                        AND B2_COD NOT LIKE '%CTL4100 I%'
                        AND B2_COD NOT LIKE '%ORA	CTL4100 I%'
                        AND b1_posipi IN (84145910,84145990,84145990,84433111,84433113,84433115,84433199,84433231,84433233,84433235,84439933,84439939,84713012,84713019,84714110,84714190,
                            84715010,84716052,84716052,84716053,84716053,84716054,84716059,84717012,84717019,84717029)
                        ORDER BY NEWID() 
                     ")
           end                  
                    @results_material.each do |row|
                         $cod_material =  row["B2_COD"]
                    end 
                        mat = $cod_material.nil?
                    if mat == true then
                        $cod_material = 'vazio'
                    end
                    puts  $cod_material 
     end     

end