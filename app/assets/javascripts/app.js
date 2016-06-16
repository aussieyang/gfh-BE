console.log("testing");

// using moustache syntax for underscore template to avoid clashing with embedded ruby syntax
_.templateSettings = {
  interpolate: /\{\{(.+?)\}\}/g
};

//passing event into the function to capture the immediate event; otherwise will default to dop level event
var addlike = function (event) {

  var dishid = function () {
    var container = $(event.target).closest('.ui-card');
    return $(container).attr("dish-id");
  }


  var options = {
    //fix hardcode url
    url: '/api/dishes/'+ dishid() +'/likes',
    method: 'post',
    dataType: 'json'
  }
  //finding the corresponding counter to the like heart by traversing the DOM
  var $counter = $(this).closest('.ui-card').find('.counter');
  console.log($counter);

  $.ajax(options).done(function(data) {
    $counter.html(data.count);
  })
};

// click on main because like doesn't exist - targeting like
$("main").on("click", ".like", addlike);


var options = {
  url: '/api/dishes',
  method: 'get',
  dataType: 'json'
}

var displayDishes = function (dishes) {
  _.each(dishes, function(dish) {


    // Using template from index ignoring script tag with .html:
    var dishTemplate = $('#dish-template').html();
    var templateFunction = _.template(dishTemplate);
    var html = templateFunction(dish);

    $('main').append(html);
  })
}

$.ajax(options).done(displayDishes);
