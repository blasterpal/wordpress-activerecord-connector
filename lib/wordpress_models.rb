module RubySlacker
module WordpressModels
  
=begin
Wordpress tables

+-----------------------+
| Tables_in_wordpress   |
+-----------------------+
| wp_comments           | 
| wp_links              | 
| wp_options            | 
| wp_postmeta           | 
| wp_posts              | 
| wp_term_relationships | 
| wp_term_taxonomy      | 
| wp_terms              | 
| wp_usermeta           | 
| wp_users              | 
+-----------------------+


=end
  
  class Post < ActiveRecord::Base
    set_table_name 'wp_posts'
    set_primary_key 'ID'
  end
  class Comment < ActiveRecord::Base
    set_table_name 'wp_comments'
    set_primary_key 'ID'
  end
  class Post < ActiveRecord::Base
    set_table_name 'wp_posts'
    set_primary_key 'ID'
  end


  
  
end
end