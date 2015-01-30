var ready;
ready = function() {

$("#fight-log").scrollTop($("#fight-log")[0].scrollHeight);

};

$(document).ready(ready);
$(document).on('page:load', ready);
