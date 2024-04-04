import MdP from './js/modulos/markdownProcessor.js';

window.onload = function() {
    // Ruta del archivo Markdown
    const markdownFile = 'documento.md';

    // Obtener el contenido del archivo Markdown
    fetch(markdownFile)
        .then(response => {
            // Verificar si la respuesta es exitosa
            if (!response.ok) {
                throw new Error('No se pudo cargar el archivo Markdown.');
            }
            // Devolver el cuerpo de la respuesta como texto
            return response.text();
        })
        .then(data => {
            // Procesar el contenido del archivo Markdown utilizando el módulo MarkdownProcessor
            const processedContent = MdP.process(data);

            // Mostrar el contenido procesado del archivo Markdown en el div con id 'markdown-content'
            document.getElementById('markdown-content').innerHTML = processedContent;
        })
        .catch(error => {
            console.error('Error:', error);
        });
};

