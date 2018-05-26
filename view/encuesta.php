
<?php
require_once ("../model/Data.php");
$d = new Data();

$opciones = $d->mostrarOpciones();

?>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="../model/bulma-0.7.1/css/bulma.min.css">
        <title>Resultados</title>
    </head>
    <body>


        <div class="columns">
            <div class="column"></div>

            <div class="column">
                <h1 class="title"><b>Encuestas</b></h1>
                <a class="button is-outlined is-centered" href="resultados.php">Ver resultados</a>
                <a class="button is-outlined is-centered" href="../index.php">Inicio</a>

                <br><br>
                <?php
                $cont = 0;
                 while ($item = $opciones->fetch_assoc()) { 
                     $cont++;
                     ?>
                    
                    <h1 class="subtitle">PREGUNTA <?php echo $cont; ?></h1>
                    <div class="box">

                        <div class="columns">
                            <div class="column">
                                <a class="button is-info is-outlined is-centered" style="width: 260"><?php echo $item['Opcion1']; ?></a>
                            </div>
                            <div class="column">
                                <a class="button is-info is-outlined is-centered" style="width: 260"><?php echo $item['Opcion2']; ?></a>
                            </div>
                        </div>

                    <?php } ?>


                </div>

            </div>

            <div class="column"></div>
        </div>

    </body>
</html>