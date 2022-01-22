
$(document).ready( () => {
  console.log('loaded');
  $('#hamburger').on("click", () => {
    console.log('clicked');
    $('.hamburger-nav').toggle();
  })

  $('#close-nav').on("click", () => {
    $('.hamburger-nav').toggle();
  })

})
