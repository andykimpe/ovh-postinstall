<?php
$handle = curl_init();
$url = "http://andy.kimpe.free.fr/ip.php";
curl_setopt($handle, CURLOPT_URL, $url);
curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
$output = curl_exec($handle);
curl_close($handle);
$IPCHECK="$output";
$REMOTE_ADDR=$_SERVER['REMOTE_ADDR'];
if ($REMOTE_ADDR == "127.0.0.1" ) {
    $IP="127.0.0.1";
} else {
    $IP=$REMOTE_ADDR;
}
require "clean.php";
if(isset($_POST["nodes"]) && isset($_POST["licensekey"]) && isset($_POST["domain"]) && isset($_POST["ip"]) && isset($_POST["dir"])){
    $returnarray = array( "hash" => '',
    "hash2" => '',
    "status" => 'Active',
    "productid" => 22,
    "checkDate" => date("Y-M-D"),
    "companyname" => "SakuraMC 专用 SolusVM 授权验证破解",
    "email" => "kasuganosora@tcotp.cn",
        "nextduedate" => (date("Y") + 100) . "-06-04",
        "validip" => "$IP",
        "configoptions" => "Slaves=23332|Mini Slaves=23333|Micro Slaves=23333"
    );
    $data = $Crack->LicenseEncode($returnarray);
    echo($data);
    //DEBUG
    //file_put_contents("test.txt", json_encode($_POST));
}else{
    echo("$IP");
}
