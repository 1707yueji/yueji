<?php
class  router{
    static function run(){   //分发路由
       if(!isset($_SERVER['PATH_INFO'])||$_SERVER['PATH_INFO']=='/'){
           $model='login';
           $fn='index';
       }else{
           $pathinfo=explode('/',substr($_SERVER['PATH_INFO'],1));//打散之前先截掉前面的‘/’；
           $model=$pathinfo[0];
           $fn=isset($pathinfo[1])?$pathinfo[1]:'index';
       }

         if(file_exists("APP/{$model}.php")){
           include 'APP/'.$model.'.php';
           if(class_exists($model)){
               $page=new $model();
               if(method_exists($page,$fn)){
                   $page->$fn();
               }else{
                   include 'APP/views/404.html';
               }
           }else{
               include 'APP/views/404.html';
           }
         }else{
             include 'APP/views/404.html';
         }




    }





}
