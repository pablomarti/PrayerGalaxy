class InserTestProducts < ActiveRecord::Migration
  
  def change
  	Category.create!({ 	:category => "Category1"})
  	Category.create!({ 	:category => "Category2"})
  	Category.create!({ 	:category => "Category3"})

  	Product.create!({ 	:name => "Test product",
  						:description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lobortis blandit tempus. Suspendisse potenti. Sed adipiscing purus rhoncus diam malesuada non molestie elit vestibulum. Pellentesque id libero non purus ornare egestas. Proin eget viverra odio. Sed nisi odio, auctor sed volutpat in, accumsan quis justo.",
  						:price => "99.99",
  						:image => "productX.jpg",
  						:category_id => 1 })
  end

end
