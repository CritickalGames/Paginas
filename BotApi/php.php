<?php
// URL de la API no oficial de Yahoo Finance para obtener datos de Apple (AAPL)
$api_url = 'https://query1.finance.yahoo.com/v8/finance/chart/AAPL?interval=1d';

// Realizar la solicitud a la API y obtener la respuesta en formato JSON
$response = file_get_contents($api_url);

// Decodificar la respuesta JSON
$data = json_decode($response, true);

// Obtener los datos que deseas mostrar (puedes personalizar según tus necesidades)
$stockData = $data['chart']['result'][0]['indicators']['quote'][0];
$closePrice = end($stockData['close']);
$volume = end($stockData['volume']);

// Crear un arreglo asociativo con los datos
$result = array(
    "ClosePrice" => $closePrice,
    "Volume" => $volume
);

// Devolver los datos en formato JSON
echo json_encode($result);
?>
