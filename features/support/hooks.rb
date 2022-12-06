    require 'report_builder'
    
      at_exit do
        ReportBuilder.input_path = "results\\report.json"
             ReportBuilder.configure do |config|
             config.report_path = "results\\report"
             config.report_types = [:json, :html]
             config.color = 'blue'
        end
        options = {
         report_title: "Test Automation Protheus"
       }
      ReportBuilder.build_report options
      end

      Before ('@SimuladorEstados') do
          @sqlserver ||= SqlServer.new
          @sqlserver.conn_bd 
          @sqlserver.consultar_preco
      end

      After ('@SimuladorEstados') do
         carrinhocompras.remover_produto
         simuladorvenda.cancelar_simulador
      end  
 
      After do |scenario|
              scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
              if scenario.failed?
                  sleep 1
                  printscreen(scenario_name.downcase!, 'falhou')
              else
                  sleep 1
                  printscreen(scenario_name.downcase!, 'passou') 
              end 
      end 



    