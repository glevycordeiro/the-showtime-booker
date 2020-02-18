import flatpickr from 'flatpickr';
// import 'flatpickr/dist/flatpickr.min.css' ----> Standard Flatpickr, Airbnb Flatpickr in the line below
import 'flatpickr/dist/themes/airbnb.css'

flatpickr(".datepicker", {
  inline: false,
  enableTime: false,
  minDate: "today",
});

flatpickr(".dobpicker", {
  inline: false,
  enableTime: false,
});
