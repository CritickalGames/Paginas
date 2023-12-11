fetch('./JSonArchivos/1-Japones.json').then(response => response.json())
    .then(data => console.log(data)).catch(error => console.error('Error:'+error));