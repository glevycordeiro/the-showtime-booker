import "bootstrap";
import "jquery";
import "plugins/flatpickr";
import "plugins/init_star_rating"
import { selectSession } from './../partials/movie_session';
selectSession();

$(function() {
  function readURL(input) {

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#user_avatar").change(function(){
    $('#img_prev').removeClass('hidden');
    readURL(this);
  });
});
import { initStarRating } from '../plugins/init_star_rating';
initStarRating();
