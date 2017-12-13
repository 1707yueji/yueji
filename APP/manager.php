<?php
class manager
{
    function __construct()
    {
        $obj = new db();
        $this->mysql = $obj->mysql;
    }

    function index()
    {
        $title = '管理员管理';
        include 'views/manager.html';
    }

    function show()
    {
        $data = $this->mysql->query("select * from manager")->fetch_all(MYSQLI_ASSOC);
        echo json_encode($data);
    }

    function insert(){
        $username = $_GET['username'];
        $password = '12345';
        $data = $this->mysql->query("insert into manager (username,password) values ('{$username}','{$password}')");
        if ($this->mysql->affected_rows) {
            echo 'ok';
            exit();
        }
        echo 'no';
    }

    function del(){
        $ids = $_GET['id'];
        $data = $this->mysql->query("delete from manager WHERE id=$ids");
        if($this->mysql->affected_rows){
            echo 'ok';
            exit();
        }
        echo 'no';
    }


    function updates(){
        $ids=$_GET['id'];
        $value=$_GET['value'];
        $data = $this->mysql->query("update manager set username='{$value}' WHERE id=$ids");
        if($this->mysql->affected_rows){
            echo 'ok';
            exit();
        }
        echo 'no';
    }





}