#language:pt
   @Regressivo_Novo_B2B2
   @ValidarPaginas
   Funcionalidade: Carrinho de Compras

      @ValidarPDP
      Esquema do Cenário: Validar pagina do produto
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando acessar a pagina do produto "<url>"
         Então a PDP será validada com sucesso "<fabricante>" "<sku>" "<centro_distribuicao>" "<descr>" "<descr_curta>" '<img>'
      Exemplos:  
         | user                           | fabricante            | sku                   | centro_distribuicao         | descr                                                                      | descr_curta                                                         | url                                                                                                   | img                                                                                                                                       |
         | douglas.ferreira@snd.com.br    | Fabricante: Asrock    | SKU: H310CM-HG4       | Centro de Distribuição *    | MOTHERBOARD ASROCK MOTHERBORAD ASROCK H310CM-HG4 INTEL LGA 1151 mATX DDR4  | H310CM-HG4 MOTHERBOARD ASROCK H310M-HG4 INTEL LGA 1151 MATX DDR4    | https://qa.snd.com.br/motherboard-asrock-motherborad-asrock-h310cm-hg4-intel-lga-1151-matx-ddr4       | img[src="https://qa.snd.com.br/images/thumbs/0064651_motherboard-asrock-motherborad-asrock-h310cm-hg4-intel-lga-1151-matx-ddr4_550.png"]  |
         | douglas.ferreira@snd.com.br    | Fabricante: TP-Link   | SKU: OC200            | Centro de Distribuição *    | CONTROLADOR TP-LINK CLOUD OMADA                                            | CONTROLADOR TP-LINK CLOUD OMADA                                     | https://qa.snd.com.br/controlador-tp-link-cloud-omada                                                 | img[src="https://qa.snd.com.br/images/thumbs/0066702_controlador-tp-link-cloud-omada_550.jpeg"]                                           |
 
      @ValidarLinkFabricantes
      Esquema do Cenário: Validar links dos fabricantes
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando acessar o link "<grupo>" "<link>"
         Então o link será validado com sucesso "<grupo>" "<link>"
      Exemplos:  
         | user                           | grupo                     | link                                |
         | douglas.ferreira@snd.com.br    | Fabricantes               | ADATA                               |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Acer                                |
         | douglas.ferreira@snd.com.br    | Fabricantes               | AMD                                 |
         | douglas.ferreira@snd.com.br    | Fabricantes               | AOC                                 |
         | douglas.ferreira@snd.com.br    | Fabricantes               | APC                                 |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Asrock                              |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Benq                                |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Brother                             |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Corel                               |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Gigabyte                            |
         | douglas.ferreira@snd.com.br    | Fabricantes               | Ver mais..                          |

      @ValidarLinkDepartamentos
      Esquema do Cenário: Validar link dos departamentos
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando acessar o link "<grupo>" "<link>"
         Então o link será validado com sucesso "<grupo>" "<link>"
      Exemplos:  
         | user                           | grupo                     | link                             |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Energia                          |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Estabilizador                    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Filtro de Linha                  |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Nobreak                          |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Racks e Acessórios               |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Componentes                      |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Cooler                           |    
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Fonte                            |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Placa Mãe/ Motherboard           |    
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Placa de Vídeo                   |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Servidores                       | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Acessórios para Servidor         |     
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Fonte para Servidor              |     
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | HD Servidores                    |     
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Memória para Servidor            |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                      |     
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Apresentador                     |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Caixa de Som                     |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Dockstation                      |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Drive Optico                     |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Networking                       |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Access Point                     |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Adaptador Wireless               |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Placa de Rede                    |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                            |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Acessórios Games                 |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Console                          |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Greatest Hits                    |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Jogos                            | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                    | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Drive Optico                     |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Console                          |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Greatest Hits                    |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Cartão de Memória                |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | HD Externo                       |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | HD Interno                       |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | HD NAS/Storage                   | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Projetores                       |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Corporativo                      |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Home Cinema                      |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Portátil                         |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Profissional                     |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Impressão & imagem               |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Impressora Laser                 |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Multifuncional Laser             |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Cartuchos                        |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Scanners                         | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Softwares                        |      
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Antivírus                        |    
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Download                         |             
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Microsoft Office                 |         
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Microsoft Windows OEM            | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Monitores                        | 
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Gamers                           |                           
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Led                              |    
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Monitor TV                       |    
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Profissionais                    |                           
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | TV                               |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Acessório TV                     |             
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Monitor Profissional             |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Computadores                     |  
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Acessórios Note                  |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | All in one                       |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Desktop                          |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Mini PC                          |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Segurança                        |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Câmera de Vigilância             |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Gravador DVR                     |    
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | PC Gamer                         |   
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Acessórios                       |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Gabinete                         |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Headset Gamer                    |            
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Monitor Gamer                    |            

     @ValidarLinkMais
      Esquema do Cenário: Validar link dos departamentos
         Dado que o usuário acesse o novo B2B 
         E efetuar login com "<user>" e senha
         Quando acessar o link mais "<grupo>" "<link_mais>" "<sub_link>"
         Então o link será validado com sucesso "<grupo>" "<sub_link>"
      Exemplos:  
         | user                           | grupo                     | link_mais                          | sub_link                 |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Componentes                        | Processadores            |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Servidores                         | Servidores               |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Servidores                         | Storage                  |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Gabinete                 |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Headset                  |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Kit Teclado e Mouse      |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Mesa Digitalizadora      |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Mouse                    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Rotulador                |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | Teclado                  |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Periféricos                        | WebCam                   |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Networking                         | Print Server             |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Networking                         | Repetidor                |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Networking                         | Roteador                 |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Networking                         | Switch                   |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                              | Jogos                    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                              | Lançamentos              |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                              | Live Card                |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                              | Outlet                   |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                              | PC Gamer                 |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Games                              | Pré-Venda                |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | HD Segurança             |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | HD Servidores            |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | Memória para Desk        |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | Memória para Notebook    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | Memória para Servidor    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | Pen Drive                |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Armazenamento                      | SSD                      |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Impressão & imagem                 | Fitas                    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Impressão & imagem                 | Rotulador                |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Impressão & imagem                 | Toners                   |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Softwares                          | Microsoft Windows Server |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | TV                                 | TV Business              |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | TV                                 | TV Hotel                 |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Computadores                       | Notebook                 |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Computadores                       | Notebook Gamer           |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | Computadores                       | Chromebooks              |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | PC Gamer                           | Mouse e Teclado Gamer    |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | PC Gamer                           | Nobreak Gamer            |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | PC Gamer                           | Placa de Vídeo           |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | PC Gamer                           | Placa Mãe / Motherboard  |
         | douglas.ferreira@snd.com.br    | Todos os departamentos    | PC Gamer                           | Processador              |





































