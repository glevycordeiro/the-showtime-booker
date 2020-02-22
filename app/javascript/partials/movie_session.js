const selectSession = () => {
  const sessions = document.querySelectorAll('.sessions-button-input');
  const quantity = document.querySelector('#number-tickets');
  sessions.forEach((session) => {
    session.addEventListener('click', () => {
      quantity.classList.remove('hidden');
    });
  });
};

export { selectSession };
