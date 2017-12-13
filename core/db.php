<?php
class db{
    public $mysql;
    function __construct(){
        $this->config();
    }

    function config(){
        $this->mysql=new mysqli('localhost','root','','yueji',3306);
        $this->mysql->query('set names utf8');
        if($this->mysql->connect_errno){
            echo '数据库连接失败，失败信息'.$this->mysql->connect_errno;
            exit;
        }




    }
}