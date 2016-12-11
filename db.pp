class wordpress::db {
  
    # Install MySQL server
    class { '::mysql::server':
    
        # Set the root password
        root_password => $wordpress::conf::root_password,

        # Create the database
        databases => {
          "${wordpress::conf::db_name}" => {
              ensure => 'persent',
              charset => 'utf8'
               }
         },
        
          # Create the user
          users => {
            "${wordpress::conf::db_user_host}" => {
              ensure => 'persent',
              password_hash => mysql_password("${wordpress::conf::db_user_password}")
                }
          },
        
            # Grant privileges to the user
            grants => {
              "${wordpress::conf:db_user_host_db}" => {
                ensure => 'persent',
                option => ['GRANT'],
                privileges =>['ALL'],
                table => "${wordpress::conf::db_name}.*",
                user => "${wordpress::conf::db_user_host}",
                 }
             },
    }
           
           
  # Install MySQL client and all bindings
  class { '::mysql::client':
        require => Class['::mysql::server'],
        bindings_enable => true
        
     }
}
