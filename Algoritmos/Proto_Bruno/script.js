window.onscroll = function() {headerGrudado()};

var header = document.getElementById("meuHeader");

var grudado = meuHeader.offsetTop;


function headerGrudado() {
  if (window.scrollY > grudado) {
    header.classList.add("grudado");
  } else {
    header.classList.remove("grudado");
  }
}