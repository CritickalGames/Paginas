fetch('./JSonArchivos/Botones.json').then(response => response.json())
    .then(data => console.log(data)).catch(error => console.error('Error:'+error));