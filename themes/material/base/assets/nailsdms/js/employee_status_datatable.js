/**
 * This class is used for manipulate customer in line table and customer in line json file
 * @type {{}}
 */

var EmployeeStatusTable = {
    options: {
      table: '#employee-status-table',
    },

    initialize: function(){
        this
            .setVars()
            .build()
            .events();
    },

    setVars: function(){
        this.$table = $(this.options.table);

        return this;
    },

    build: function(){
        this.datatable = this.$table.DataTable({
            ajax: {
                url: "../../assets/data/employee_status.json",
                dataSrc: function (json) {
                    /*
                       Manipulate the json file generate a data array with format:
                       [{
                            id: "1",
                            employee_name: "firstname lastname",
                            employee_american_name: "americanname",
                            employee_status:"",
                            radio_select_bt: "",
                        },...
                       ]
                     */

                    var employee_status_arr = [];
                    var obj_count = json.length;


                    for (var i = 0; i < obj_count; i++){
                        eobj_id = json[i].id;
                        eobj_name = json[i].e_first_name + " " + json[i].e_last_name;
                        eobj_american_name = json[i].e_american_name;
                        eobj_status = "";
                        eobj_radio_select_bt = "";

                        if (json[i].e_at_work == 1)
                        {
                            switch(json[i].e_working){
                                case '1':
                                    eobj_status = '<span class="label label-danger">Working</span>';
                                    eobj_radio_select_bt = '<input data-dmsemployeeid="' + json[i].id + '" name="select-nail-tech" type="radio"/>';
                                    break;
                                case '0':
                                    eobj_status = '<span class="label label-info">Available</span>';
                                    eobj_radio_select_bt = '<input data-dmsemployeeid="' + json[i].id + '" name="select-nail-tech" type="radio"/>';
                                    break;
                                default:
                                    eobj_status = 'Not specified';
                                    eobj_radio_select_bt = '<input data-dmsemployeeid="' + json[i].id + '" name="select-nail-tech" type="radio" disabled/>'
                            }
                        }
                        // Create an object and push it to customer_service_arr
                        var eobj = {
                            id: eobj_id,
                            employee_name: eobj_name,
                            employee_american_name: eobj_american_name,
                            employee_status: eobj_status,
                            radio_select_bt: eobj_radio_select_bt,
                        };
                        employee_status_arr.push(eobj);
                    }
                    return employee_status_arr;

                }
            },
            ordering: false,
            info: false,
            pagingType: "numbers",
            columns: [
                { "data": "radio_select_bt"},
                { "data": "employee_american_name"},
                { "data": "employee_status"},
            ],
            language: {
                "sSearchPlaceholder": "Search..",
                "lengthMenu": "_MENU_",
                "search": "_INPUT_"
            }

        });

        //window.dt = this.datatable;

        return this;
    },

    events: function(){

        return this;
    }

}

$(document).ready(function(){
    EmployeeStatusTable.initialize();
});