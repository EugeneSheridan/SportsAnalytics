<?php

namespace DB;

class Db {
  private static $db;
  
  function __construct() {
      if(is_null($this->db)){
          $this->db=new PDO('mysql:host=localhost;port=3306;dbname=sportsanalytics', 'root', '', array( PDO::ATTR_PERSISTENT => false));
      }
  }
    
}

?>