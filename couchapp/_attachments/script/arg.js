(function() {
  $(document).ready(function() {
    var doc = {};
    var print_doc = function() {
      $("#debug").text($.toJSON(doc));
    };

    var tmpl = {};
    $.each(['input_text'], function(i, v) {
      $.get("js_templates/" + v + ".html", function(data){
        tmpl[v] = data;
      });
    });
    $("#new_room").bind("click", function(e) {
        $("#form_holder").hide();
        $("#form_holder").animate({backgroundColor: '#fff', color: '#000', width: 240}, 1000);

        $("#form_holder").html(template(tmpl.input_text, { label: "name", value: "" }) + "<br />" +
                               template(tmpl.input_text, { label: "foo", value: "" }));
        $("#form_holder input").bind("change", function() {
          doc[this.name] = this.value;
          print_doc();
        });
        $("#new_room").hide();
    });
  });
})();
