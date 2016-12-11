class wordpress::web {

  # Install Apache
  # I use prefork as the MPM (Multi-Processing Module) 
  # to maximize compatibility with other libraries.
    
    class {'apache':
        mpm_module => 'prefork'
   }
   
   # Add support for PHP
    
    class {'::apache::mod::php':
    }
 }
