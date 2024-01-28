fetch('./JSonArchivos/Japones1.json').then(response => response.json())
    .then(data => console.log(data)).catch(error => console.error('Error:'+error));