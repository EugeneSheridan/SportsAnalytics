<?php

namespace SPORTSANALYTICS;

class Sport {

  private $id;
  private $name;

  public function __construct(){
    $numArgs=func_num_args();
    $args=func_get_args();

    if($numArgs==2){
      $this->setId($args[0]);
      $this->setName($args[1]);
    }
  }

  public function getId(){
    return $this->id;
  }

  public function setId($id){
    $this->id=$id;
  }

  public function getname(){
    return $this->name;
  }

  public function setName($name){
    $this->name=$name;
  }

  public function toString(){
    echo "Sport exists with:\n\r";
    echo "    Id: ". $this->getId() . "\n\r";
    echo "    Name: ". $this->getName(). "\n\r";
  }
  
} //end of class Sport

?>
