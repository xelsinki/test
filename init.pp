class wordpress {
  # Load all variables - Ladataaan kaikki muuttujat
  class { 'wordpress::conf':
  }
  
  # Apache & PHP
  class { 'wordpress::web':
  }
  
  # Database
  class { 'wordpress::db':
  }
  
  # Wordpress installation 
  class {'wordpress::wp':
      require => Notify['Apache Installation Complete']
  }
  
  # Display that messages after complete installations
  
   nofify {'MySQL Installation Complete':
       require => Class['wordpress::db']
   }
   
   nofify {'Apache Installation Complete':
       require => Class['wordpress::web']
   }
  
   nofify {'Wordpress Installation Complete':
       require => Class['wordpress::wp']
   }
}
