/**
 * This class is used for manipulate customer in line table and customer in line json file
 * @type {{}}
 */

var CustomerInLineTable = {
    options: {
      table: '#customer-in-line-table',
      dialog:{
          wrapper: '#dialog',
          cancelButton: '#dialogCancel',
          confirmButton: '#dialogConfirm',
      }
    },

    initialize: function(){
        this
            .setVars()
            .build()
            .events();
    },

    setVars: function(){
        this.$table = $(this.options.table);

        //create dialog
        this.dialog = {};
        this.dialog.$wrapper = $(this.options.dialog.wrapper);
        this.dialog.$cancel = $(this.options.dialog.cancelButton);
        this.dialog.$confirm = $(this.options.dialog.confirmButton);

        return this;
    },

    build: function(){
        this.datatable = this.$table.DataTable({
            ajax: {
                url: "../../assets/data/customer_in_line.json",
                dataSrc: function (json) {
                    /*
                       Manipulate the json file generate a data array with format:
                       [{
                            id: "1",
                            customer_name: "firstname lastname",
                            service_type: ["icon service type", "icon service type"],
                            sign_in: "hh:mm"
                            cancel_button: "<a class="btn btn-icon btn-sm btn-default"><i class="icon md-close"></i> </a>"
                        },...
                       ]
                     */

                    var customer_inline_arr = [];
                    var customer_obj;

                    var obj_count = json.length;
                    console.log("my obj_count: ", obj_count);

                    for (var i = 0; i < obj_count; i++){
                        cobj_id = json[i].id;
                        cobj_name = json[i].c_firstname + " " + json[i].c_lastname;

                        cobj_service_type = [];
                        track_cobj_service_type = [];
                        cobj_sign_in = '';
                        earliest_date = new Date();
                        earliest_customer_time = '';
                        temp_date = '';
                        c_cancel_button = '';

                        var work_count = json[i].work_tb.length;
                        for (var ii = 0; ii < work_count; ii++){
                            switch (json[i].work_tb[ii].work_type.work_category){
                                case 'hand':
                                    if($.inArray('hand', track_cobj_service_type) == -1){
                                        cobj_service_type.push("<i class='nailsdms-circle-hand'></i>");
                                        track_cobj_service_type.push('hand');
                                    }
                                    break;
                                case 'feet':
                                    if($.inArray('feet', track_cobj_service_type) == -1){
                                        cobj_service_type.push("<i class='nailsdms-circle-feet'></i>");
                                        track_cobj_service_type.push('feet');
                                    }
                                    break;
                                case 'waxing':
                                    if($.inArray('waxing', track_cobj_service_type) == -1){
                                        cobj_service_type.push("<i class='nailsdms-circle-face'></i>");
                                        track_cobj_service_type.push('waxing');
                                    }
                                    break;
                                case 'other':
                                    if($.inArray('other', track_cobj_service_type) == -1){
                                        cobj_service_type.push("<i class='nailsdms-circle-other'></i>");
                                        track_cobj_service_type.push('other');
                                    }
                                    break;
                                default:
                                    // dont' need to push anything in
                            }

                            // process to get earliest time
                            temp_date = new Date(json[i].work_tb[ii].work_created_date);
                            if (earliest_date > temp_date) {
                                earliest_date = temp_date;
                            }
                        }
                        earliest_customer_time = earliest_date.getHours() + ":" + earliest_date.getMinutes();

                        c_cancel_button = "<a class='cancel-service btn btn-icon btn-sm btn-default' " + "data-dmsCustomerId=" + json[i].id +  "><i class='icon md-close'></i> </a>";
                        // Create an object and push it to customer_service_arr
                        var cobj = {
                            id: cobj_id,
                            customer_name: cobj_name,
                            service_type: cobj_service_type,
                            sign_in: earliest_customer_time,
                            cancel_button: c_cancel_button,
                        };
                        customer_inline_arr.push(cobj);
                    }
                    return customer_inline_arr;

                }
            },
            columns: [
                { "data": "customer_name"},
                { "data": "service_type[ ]"},
                { "data": "sign_in"},
                { "data": "cancel_button"}
            ],
            language: {
                "sSearchPlaceholder": "Search..",
                "lengthMenu": "_MENU_",
                "search": "_INPUT_"
            }

        });

        window.dt = this.datatable;

        return this;
    },

    events: function(){

        return this;
    },

}

$(document).ready(function(){
    CustomerInLineTable.initialize();
});