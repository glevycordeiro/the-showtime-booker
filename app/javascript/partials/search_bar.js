const openSearch = () => {
  const button = document.querySelector("#search-bar .search-button");
  const input = document.querySelector("#search-bar .search-input");
  button.addEventListener("click", event => {
    event.preventDefault();
    input.classList.toggle("hide-search-input");
  });
};

export { openSearch };
