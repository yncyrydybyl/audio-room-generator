(function() {
    var tmpl = "<label><%= label %> <input type=\"text\" name=\"<%= label %>\" value=\"<%= value %>\"></label>";
    $(document).ready(function() {
        $("#new_room").bind("click", function(e) {
            $("#form_holder").html(template(tmpl, { label: "name", value: "" }) +
                                   template(tmpl, { label: "foo", value: "" }));
            $("#form_holder input").bind("change", function() {
                $.head(this.value, {}, function(headers) {
                    console.log(headers); });
                // console.log("%o: %o", this.name, this.value);
            });
        });
    });
})();