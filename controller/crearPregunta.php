<?php

require_once "../model/Data.php";
$d = new $Data();


$op1 = $_REQUEST["pregunta1"];
$op2 = $_REQUEST["pregunta2"];

$d->ejecutarQuery("");