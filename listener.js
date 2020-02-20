
const button = document.querySelectorAll("btn btn-primary sessions-button");
button.addEventListener("click", () => {
  button.innerHTML = "Bingo!";
  audio.play();
  document.getElementById("clickme").disabled = true;
});
