const openModal = () => {
  const buttons = document.querySelectorAll(".cancel-booking");
  const modal = document.querySelector(".confirmation-modal");
  buttons.forEach(button => {
    button.addEventListener("click", event => {
      modal.classList.remove("hidden-modal");
    });
  });
  const closeBtn = document.querySelectorAll(".close-confirmation-modal");
  closeBtn.forEach(button => {
    button.addEventListener("click", event => {
      modal.classList.add("hidden-modal");
    });
  });
};

export { openModal };
