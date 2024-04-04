document.querySelector('#pdffFile').addEventListener('change', () => {

    let pdffFile = document.querySelector('#pdffFile').files[0];
    console.log(document.querySelector('#pdffFile').files[0]);
    let pdffFileURL = URL.createObjectURL(pdffFile) + "#toolbar=0";

    document.querySelector('#vistaPrevia').setAttribute('src', "https://github.com/CritickalGames/tuerizotraudciones/blob/main/04.pdf");
})
document.querySelector('#vistaPrevia').setAttribute('src', "04.pdf");
