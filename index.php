<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="model/bulma-0.7.1/css/bulma.min.css">
        <title>Preguntas</title>
    </head>
    <body>

        <div class="box is-centered">


            <form action="controller/crearPregunta.php" method="POST">

                <div class="columns">
                    <div class="column"></div>

                    <div class="column">
                        <input class="input is-centered is-outlined is-primary is-rounded" type="text" name="pregunta1" id="pregunta1" placeholder="opcion 1:" style="height: 20" required >
                        <br><br>
                        <input class="input is-centered is-outlined is-primary is-rounded" type="text" name="pregunta2" id="pregunta2" placeholder="opcion 2: " required >
                        <br><br>
                        <input class="button is-success is-outlined" type="submit" value="Crear Pregunta">
                        <br><br>
                        <a class="button is-outlined" href="view/respuestas.php">Probar Encuesta</a>
                    </div>

                    <div class="column"></div>

                </div>



            </form>

        </div>


    </body>
</html>
