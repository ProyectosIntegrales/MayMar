$(document).ready(function () {

    $(document).ready(function () {
        $("#txtNombre").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "WS/WebService.asmx/getClientes",
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1],
                                rsoc: item.split('-')[2]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("#txtCliente").val(i.item.val);
                $("#hflCliente").val(i.item.val);

                $("#txtRazon").val(i.item.rsoc);
                $("#hflRazon").val(i.item.rsoc);
            },
            minLength: 1
        })

    });



    $("#txtImp1").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "WS/WebService.asmx/getImporters",
                data: "{ 'prefix': '" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: item.split('-')[0],
                            val: item.split('-')[1],
                            dir: item.split('-')[2]
                        }
                    }))
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        select: function (e, i) {
            $("#hflImp2").val(i.item.dir);
            $("#txtImp2").val(i.item.dir);
        },
        minLength: 1
    })


    $("#txtNombreExp").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "WS/WebService.asmx/getExporters",
                data: "{ 'prefix': '" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: item.split('-')[0],
                            nom: item.split('-')[0],
                            dir: item.split('-')[1],
                            cdd: item.split('-')[2],
                            rfc: item.split('-')[3],
                            idd: item.split('-')[4]
                        }
                    }))
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        select: function (e, i) {
            $("#hflID").val(i.item.idd);
            $("#txtNombreExp").val(i.item.nom);
            $("#txtDireccion").val(i.item.dir);
            $("#txtCiudad").val(i.item.cdd);
            $("#txtRFC").val(i.item.rfc);
        },
        minLength: 1
    })
});

