(function() {
 

  $(document).ready(function() {
    var tmpl = {};
    $.get("js_templates/post.html", function(data){
      tmpl.post = data;
    });
    $("#new_room").bind("click", function(e) {
        $("#form_holder").hide();
        $("#form_holder").animate({backgroundColor: '#fff', color: '#000', width: 240}, 1000);

        $("#form_holder").html(template(tmpl.post, { label: "name", value: "" }) + "<br />" +
                               template(tmpl.post, { label: "foo", value: "" }));
        $("#form_holder input").bind("change", function() {
            $.head(this.value, {}, function(headers) {
                console.log(headers); });
            // console.log("%o: %o", this.name, this.value);
        });
        $("#new_room").hide();
    });
  });
})();
