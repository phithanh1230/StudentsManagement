function ondelete(id) {
    bootbox.confirm('Are you sure?', function (result) {
        if (result == true) {
            $.ajax({
                type: "POST",
                url: '@Url.Action("Delete","Students")',
                data: { id: id },
                success: function () { alert("OK"); },
                error: function () { alert("No"); }

            })
        }
    });
}