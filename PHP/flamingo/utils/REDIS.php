<?php
/*
 * myRedis类 仅用phpredis封装, 仅用于连接, 操作还是依赖于类内的phpredis对象
 * author: huasong
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";

class myRedis
{
    private $all_conn = array();
    public $redis = NULL;
    private $ttl = 3600;
    public  $debug = true;

    function __construct( $debug=true ){
        $this->debug = $debug;
    }
    function __destruct(){ // 
        if( $this->redis ){
            $this->redis->close();
        }
        if( $this->all_conn ){
            foreach( $this->all_conn as $_redis ){
                $_redis->close();
            }
        }
    }

    /*
     *
     */
    function use_redis($conn_name){
        if( isset( $this->all_conn[$conn_name] ) ){
            $this->redis = $this->all_conn[$conn_name];
        }else{
            global $REDIS_CONFIG;
            if(!isset($REDIS_CONFIG[$conn_name])){
                if($this->debug){
                    die("redis config name not exist !");
                }else{
                    exit;
                }
            }
            $config = $REDIS_CONFIG[$conn_name];
            $config_count = count($config);
            if($config_count > 1){ //一般是多个从库的情况，这里简单地采用随机连一个数据库
                $config = $config[rand(0, $config_count - 1)];
            }else{
                $config = $config[0];
            }
            $this->redis = new Redis();
            $this->redis->pconnect( $config['host'], $config['port'] );
            if( $config['password'] ){
                $auth_result = $this->redis->auth( $config['password'] );
                if( ! $auth_result ){
                    die("{$conn_name} redis auth fail !");
                }
            }
            if( isset($config['dbN']) ){
                $this->redis->select( $config['dbN'] );
            }
            else{
                $this->redis->select( 0 );
            }
            //return $this;
        }
    }
}
