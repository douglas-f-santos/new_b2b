class Home < SitePrism::Page
   #-------------------------------------------------------------------#
   #                         E L E M E N T O S                         #
   #---------------------------------- ---------------------------------#
   element :descr_link,      '.current-item'
   element :descr_filtro,    '.side-2'
   element :descr_page,      '.category-description'
   element :descr_forn,      '.manufacturer-description'

   
   #-------------------------------------------------------------------#
   #                           M É T O D O S                           #
   #-------------------------------------------------------------------#
    def acessar_link(grupo, link)
            first(:xpath,'//span[text()="'+grupo+'"]').click
            first(:xpath,'//span[text()="'+link+'"]').click
    end 

    def acessar_link_mais(grupo, link_mais,sub_link)
            first(:xpath,'//span[text()="'+grupo+'"]').click
            first(:xpath,'//label[text()="Mais em '+link_mais+' ▼ "]').click
            first(:xpath,'//span[text()="'+sub_link+'"]').click
    end 
end
  

