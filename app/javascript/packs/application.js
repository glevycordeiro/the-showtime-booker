import "bootstrap";
import "jquery";
import "plugins/flatpickr";
import "plugins/init_star_rating";
import { initStarRating } from "../plugins/init_star_rating";
initStarRating();
import { selectSession } from "./../partials/movie_session";
import { openSearch } from "./../partials/search_bar";
import { openModal } from "./../partials/confirmation_modal";

selectSession();
openModal();

$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $("#img_prev").attr("src", e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#user_avatar").change(function() {
    $("#img_prev").removeClass("hidden");
    readURL(this);
  });
});
