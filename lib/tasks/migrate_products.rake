desc 'Migrate 100 products from Edmodo API'

task migrate_products: :environment do
  require 'json'
  require 'open-uri'

  #formulate url
  subjects = ["math", "mitosis", "fractions","algebra", "history","graphs","music","geography","grammar","poetry"]
  base_url =  "https://spotlight.edmodo.com/api/search/"
  uri = URI.parse(base_url)

  subjects.each do |subject|

    params = {
      'q' => subject,
      'page_length'=>10
      }

    uri.query = URI.encode_www_form(params)
    results = JSON.parse(open(uri).read)
   

    #parse results
    break if results["products"].empty? 

    results["products"].each do |product|
      product_details = product["_source"]
     
      #all except [edmodo_id, role]
     

      #create owner
      owner = product_details["owner"]
      @owner = Owner.new

      #TODO:use @owner.attributes.keys instead
      #@owner.edmodo_id = owner["id"]
      #@owner.role = owner["type"]
      #owner_attributes = ["first_name","last_name", "store_url", "edmodo_url"]
      owner_attributes = @owner.attributes.keys
      owner_attributes.each do |attribute|
        if (attribute == "edmodo_id")
          @owner.edmodo_id = owner["id"]
        elsif (attribute == "role")
          @owner.role = owner["type"]
        else
          @owner.send("#{attribute}=",owner[attribute])
        end

      end
      @owner.save


      #create product 
      #prod_attributes (all except [url, owner] )
      prod_attributes = ["title","price", "img_path", "seller_thumb_url", "currency", "long_desc_html", "avg_rating", "num_raters"]
      @product = Product.new
      @product.owner_id = @owner.id
      #url attribute name changed to edmodo_url
      @product.edmodo_url = product_details["url"]
      prod_attributes.each do |attribute|
        @product.send("#{attribute}=",product_details[attribute])
      end
      @product.save
    end
  end


end
