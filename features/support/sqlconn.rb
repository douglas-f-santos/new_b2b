require 'tiny_tds'

class SqlServer
    def initialize
         @username = 'promicro'
         @password = 'aquarela'
         @host = '192.168.6.159'
         @port = 1433
         @database = 'SND'
         @azure = false
    end   

    def conn_bd
           @client = TinyTds::Client.new username: @username, password: @password, 
           host: @host, port: @port, database: @database, azure: @azure, timeout: 200
           puts 'Conexão OK'
    end    

    def consultar_preco
           arq_f = File.new("features/support/preco_base/preco_base.txt", "w")
           $execucao.each { |line| arq_f.puts(line) }
           arq_f.close
           
           @results = @client.execute("SELECT PRECO,ESTADO FROM precomaterial 
           WHERE codmaterial = 'E2270SWHEN S'")
                @results.each do |row|
                    @preco = row['PRECO']
                    @estado = row['ESTADO']
                    @estado = @estado.gsub("'","")
                    @estado = @estado.gsub(",","")

                    @preco = @preco.to_f
                    $execucao.push("#{@preco}#{';'}#{@estado}#{';'}")
                    f = File.new("features/support/preco_base/preco_base.txt", "a+")
                    $execucao.each { |line| f.puts(line) }
                    f.close
                    $execucao = []
               end
     end

     def ler_preco_base(estado,consumo_revenda,contribuinte)
            if consumo_revenda == 'C' then
                  c_r = '_UC'
                  $chave = $preco_simulado +';'+estado + c_r
            end   

            if contribuinte == 'N' then
                  cont = '_NC'
                  $chave = $preco_simulado +';'+estado + cont
            end   

            File.open("features/support/preco_base/preco_base.txt", 'r') do |dados|
                 while line = dados.gets
                           if $chave == line then
                                 $preco_final_tab = line [0..5]  
                                 puts 'precofinaltab'
                                 puts $preco_final_tab
                           end
                           
                 end
            end     
     end            
end
