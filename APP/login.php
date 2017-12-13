<?php
class login{
    function __construct(){
        $obj= new db();
        $this->mysql=$obj->mysql;
    }

    function index(){
        include 'views/login.html';
    }
    function check(){
        $username=$_REQUEST['username'];

        $password=$_REQUEST['password'];
        $data= $this->mysql->query("select * from manager")->fetch_all(MYSQLI_ASSOC);

        for($i=0;$i<count($data);$i++){
            if($username==$data[$i]['username'] && $password==$data[$i]['password']){
              echo 'ok';
              exit;
            }
        }
        echo 'no';
    }

}
