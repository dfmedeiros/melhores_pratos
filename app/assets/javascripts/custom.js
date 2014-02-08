/*global jQuery:false */
jQuery(document).ready(function($) {

  jQuery("[data-rel=popover]").popover({
    trigger: 'hover',
    placement: 'bottom',
    html: true
  });
  jQuery("[data-rel=popover-left]").popover({
    trigger: 'hover',
    placement: 'left',
    html: true
  });

  // social network icon tooltip
  $('.social li a').tooltip();

  //scroll to top
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('.scrollup').fadeIn();
    } else {
      $('.scrollup').fadeOut();
    }
  });
  $('.scrollup').click(function() {
    $("html, body").animate({scrollTop: 0}, 600);
    return false;
  });

  // accordion
  $('.accordion').on('show', function(e) {
    $(e.target).prev('.accordion-heading').find('.accordion-toggle').addClass('active');
    $(e.target).prev('.accordion-heading').find('.accordion-toggle i').removeClass('icon-plus');
    $(e.target).prev('.accordion-heading').find('.accordion-toggle i').addClass('icon-minus');
  });

  $('.accordion').on('hide', function(e) {
    $(this).find('.accordion-toggle').not($(e.target)).removeClass('active');
    $(this).find('.accordion-toggle i').not($(e.target)).removeClass('icon-minus');
    $(this).find('.accordion-toggle i').not($(e.target)).addClass('icon-plus');
  });


  // add animation effect on call action area
  $(".call-action").hover(
    function() {
      $('.cta a').addClass("animated tada");
    },
    function() {
      $('.cta a').removeClass("animated tada");
    }
  );


  // Create the dropdown base
  $("<select />").appendTo("nav");
  // Create default option "Go to..."
  $("<option />", {
    "selected": "selected",
    "value": "",
    "text": "Go to..."
  }).appendTo("nav select");

  // Populate dropdown with menu items
  $("nav a").each(function() {
    var el = $(this);
    $("<option />", {
      "value": el.attr("href"),
      "text": el.text()
    }).appendTo("nav select");
  });

  // To make dropdown actually work
  // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
  $("nav select").change(function() {
    window.location = $(this).find("option:selected").val();
  });

  $('ul.nav li.dropdown').hover(function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
  }, function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
  });


  //add effect on box
  $(".box").hover(
    function() {
      $(this).find('.icon').addClass("animated fadeInDown");
      $(this).find('h4').addClass("animated fadeInUp");
    },
    function() {
      $(this).find('.icon').removeClass("animated fadeInDown");
      $(this).find('h4').removeClass("animated fadeInUp");
    }
  );

  $('.post-meta.recommendations li.first span a').click(function(){
    id = $(this).parent().parent().parent().attr('id');
    i = $(this).parent().parent().find('i');

    $('#recommendations-dish-' + id).slideToggle('slow');

    if (i.attr('class') == 'icon-chevron-down') {
      i.removeClass('icon-chevron-down');
      i.addClass('icon-chevron-up');
    } else {
      i.removeClass('icon-chevron-up');
      i.addClass('icon-chevron-down');
   }

   return false;
  });

  $('.post-meta.best li.first span a').click(function(){
    id = $(this).parent().parent().parent().attr('id');
    i = $(this).parent().parent().find('i');

    $('#best-dish-' + id).slideToggle('slow');

    if (i.attr('class') == 'icon-chevron-down') {
      i.removeClass('icon-chevron-down');
      i.addClass('icon-chevron-up');
    } else{
      i.removeClass('icon-chevron-up');
      i.addClass('icon-chevron-down');
     }

     return false;
  });

});