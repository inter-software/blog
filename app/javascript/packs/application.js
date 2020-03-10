
require("@rails/ujs").start()
//require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


global.toastr = require("toastr")

import 'bootstrap';
import 'cocoon';
import '../stylesheets/application';
import 'turbolinks'


/*document.addEventListener("turbolinks:load", () => {
  //$('[data-toggle="tooltip"]').tooltip();
  //$('[data-toggle="popover"]').popover();
})*/

$(document).ready(function() {
    $('#questions')
        .on('cocoon:before-insert', function(e,question_to_be_added) {
            question_to_be_added.fadeIn('slow');
        })
        .on('cocoon:before-remove', function(e, question) {
            $(this).data('remove-timeout', 1000);
            question.fadeOut('slow');
    });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


/*$(document).on('ready page:load', function () {
  $('#article_categories_ids').chosen({
    allow_single_deselect: true,
    width: '100%'
  })
});*/
 


   

