<?php

require_once("../model/Data.php");
$d = new Data();


$primeraOpcion = $_REQUEST["pregunta1"];
$segundaOpcion = $_REQUEST["pregunta2"];

$query = "CALL registrarPregunta('$primeraOpcion','$segundaOpcion');";

$d->ejecutarQuery($query);

header("location: ../index.php");