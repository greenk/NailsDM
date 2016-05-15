var CustomerCard = {
    options: {
        myCanvas: '#customer-card-canvas',

    },

    initialize: function() {
      this
          .setVars()
          .build()
          .events();
    },

    setVars: function() {
        this.$myCanvas = $(this.options.myCanvas);

        return this;
    },

    build: function() {
        //Calling ajax to get JSON data
        //console.log("this.$myCanvas", this.$myCanvas);
        var _self = this;
        $.ajax({
            url: "../../assets/data/customer-card.json",
            //data to send to server
            /*
            data: {

            },*/
            type: "GET",
            dataType: "json",
            beforeSend: function(){
                _self.$myCanvas.find('.loading-spinner').removeClass('hidden');
            },
            error: function(){
                console.log("I am here", _self.$myCanvas);
                _self.$myCanvas.find('.loading-spinner').addClass('hidden');
                _self.$myCanvas.find('.error-happened').removeClass('hidden');
                _self.$myCanvas.children('div.panel-heading, div.panel-body').addClass('hidden');

            },
            success: function( json ){
                _self.$myCanvas.find('.loading-spinner').addClass('hidden');

                // REMEMBER store json data to our canvas element
                $('#customer-card-canvas').data('customer_and_menu', json);

                _self.buildCustomerObject(json);

            }
        });

        return this;
    },
    /**
     * Use this function to construct object data for tracking employees while they work on customer
     * - we keep adding, deleting, editing customer service on object_service_array
     * - our object data is  object_service_array = [object_service, object_service, etc]
     * - each object_service = {
     *                          name : <name of object service>,
     *                          index : <position of object service in object_service_array>,
     *                          work_array : [<service object which is copied from our work_tb in json file>],
     *                          $container_class_name: <string - store class name of service container which appear on html page>
      *                        }
     * @param json a json we got after make an ajax call
     * @returns {updated this.customer_data_and_menu, this.object_service_array}
     */
    buildCustomerObject: function(json) {
        this.customer_data_and_menu = json;
        this.object_service_array = [];
        var _self = this;
        var _td = json;

        // Set Panel title with customer name
        if ( _td.customer != null){
            this.$myCanvas.children('.panel-heading').children('.panel-title').html(_td.customer.c_firstname + ' ' + _td.customer.c_lastname);
        }

        if (_td.customer.work_tb.length > 0) {
            var _nail_tech_name_array = [];
            var _request_nail_tech_array = [];
            var _object_service_array = [];
            var _work_category_array = [];

            for (var i = 0; i < _td.customer.work_tb.length; i++){
                // Get Nails tech list
                if(_td.customer.work_tb[i].employee != null){
                    if( _td.customer.work_tb[i].employee.e_american_name != null){
                        _nail_tech_name_array.push(_td.customer.work_tb[i].employee.e_american_name);
                    } else{
                        _nail_tech_name_array.push(_td.customer.work_tb[i].employee.e_first_name + ' ' + _td.customer.work_tb[i].employee.e_last_name);
                    }
                }
                // Get request nail tech list
                if(_td.customer.work_tb[i].request_for != null){
                    _request_nail_tech_array.push(_td.customer.work_tb[i].request_for);
                }

                var _index_value = $.inArray(_td.customer.work_tb[i].work_type.work_category, _work_category_array);
                //console.log("my _index_value", _index_value);
                if (_index_value == -1)
                {
                    _work_category_array.push(_td.customer.work_tb[i].work_type.work_category);

                    // Create a new type of work service object and store it in an array
                    var _object_service = {
                        'name': _td.customer.work_tb[i].work_type.work_category,
                        'index': _work_category_array.length - 1,
                        'work_array': [],
                        '$container_class_name': '',
                    };
                    _object_service.work_array.push(_td.customer.work_tb[i]);
                    _object_service_array.push(_object_service);
                }
                else {
                    // find where it is in _object_service_array and then push it in work_tb array
                    // using index value
                    _object_service_array[_index_value].work_array.push(_td.customer.work_tb[i]);
                }

                // Need to come with better idea
                /*
                switch (_td.customer.work_tb[i].work_type.work_category){
                    case 'hand':
                        if($.inArray(_td.customer.work_tb[i].work_type.work_category, _service_type_track) == -1){
                            var $_new_hand_services = _self.$myCanvas.find('.service-type-template').clone();
                            $_new_hand_services.children('p.service-title-container').find('span.service-title').html('hand services');
                            $_new_hand_services.children('p.service-title-container').find('i').removeClass('nailsdms-circle-hand').addClass('nailsdms-circle-hand');


                        } else{


                        }
                        var $_new_hand_services_row = $_new_hand_services.find('tr.row-template').clone();
                        $_new_hand_services_row.removeAttr('class');
                        var $_first_col = $_new_hand_services_row.children('td').eq(0);
                        var $_second_col = $_new_hand_services_row.children('td').eq(1);
                        var $_third_col = $_new_hand_services_row.children('td').eq(3);
                        var $_fourth_col = $_new_hand_services_row.children('td').eq(4);

                        $_first_col.find('input').attr('name', 'service-hand-name[]');
                        $_first_col.find('input').attr('id', 'customer-select-hand-service-' + _td.customer.work_tb[i].id );
                        $_first_col.find('input').attr('value', _td.customer.work_tb[i].work_type.work_name );
                        $_first_col.find('label').attr('for','customer-select-hand-service-' + _td.customer.work_tb[i].id );

                        $_second_col.children('div').remove();


                        break;
                    case 'feet':
                        break;
                    case 'waxing':
                        break;
                }
                */
            }

            // After construct our object_service_array from json file,
            // we call drawServiceTables to show services in object_service_array to screen
            _self.drawServiceTables(_object_service_array);

            console.log("My _object_service_array", _object_service_array);
            this.object_service_array = _object_service_array;

            this.$myCanvas.children('.panel-body').find('.request-nail-tech').html('Request: ' + _request_nail_tech_array.join(', '));
            this.$myCanvas.children('.panel-body').find('.nail-tech-serve').html('Nails tech: ' + _nail_tech_name_array.join(', '));
        }

        return this;
    },

    /**
     * Draw html table using data from object_service_array
     * - update $container_class_name for each object_service
     * @param object_service_array
     */
    drawServiceTables: function (object_service_array) {

        var _self = this;

        // TODO:
        // for each object_service
        // create a new service-type-container by cloning a service-type-container-template
        // fill this new service-type-container  with data in object_service
        // append this service-type-container to service-type-container-master

        for (var i = 0; i < object_service_array.length; i++) {

            var $_new_services_container = _self.$myCanvas.find('.service-type-container-template').clone();

            $_new_services_container.removeClass('service-type-container-template').addClass('service-type-container-' + object_service_array[i].name);
            $_new_services_container.children('.service-title-container').find('i').removeClass('nailsdms-circle-hand').attr('class', 'nailsdms-circle-' + object_service_array[i].name);
            $_new_services_container.children('.service-title-container').find('span.service-title').text(object_service_array[i].name + ' Services');

            // loop through work_array and create a new row for each work
            for (var ii = 0; ii < object_service_array[i].work_array.length; ii++){
                var $_new_work_row = _self.$myCanvas.find('tr.row-template').clone();

                $_new_work_row.removeClass('.row-template').addClass('service-' + object_service_array[i].work_array[ii].work_type.work_category + '-' + object_service_array[i].work_array[ii].work_type.work_name);

                var $_new_work_row_first_col = $_new_work_row.children('td').eq(0);
                var $_new_work_row_second_col = $_new_work_row.children('td').eq(1);
                var $_new_work_row_third_col = $_new_work_row.children('td').eq(2);
                //var $_new_work_row_fourth_col = $_new_work_row.children('td').eq(3);

                $_new_work_row_first_col.find('input').attr('value', object_service_array[i].work_array[ii].work_type.work_name);
                $_new_work_row_first_col.find('input').attr('name', 'service[' + object_service_array[i] + '][' + object_service_array[i].work_array[ii].work_type.work_name + ']');
                $_new_work_row_first_col.find('input').attr('id', object_service_array[i].work_array[ii].work_type.work_name + '-' + object_service_array[i].work_array[ii].work_type.id);
                $_new_work_row_first_col.find('label').attr('for', object_service_array[i].work_array[ii].work_type.work_name + '-' + object_service_array[i].work_array[ii].work_type.id);

                $_new_work_row_second_col.find('select').addClass('service-select-' + object_service_array[i].work_array[ii].work_type.work_category + '-' + object_service_array[i].work_array[ii].work_type.work_name);
                //todo:
                //get menu for work_category to prepare for generating select option
                var _work_category_menu_array = _self.getWorkCategoryMenu(_self.customer_data_and_menu.services_list, object_service_array[i].work_array[ii].work_type.work_category );
                var $_my_select = $_new_work_row_second_col.find('select');
                $.each(_work_category_menu_array, function(key, value){
                   $_my_select.append($("<option></option>")
                                            .attr("value", key)
                                            .text(value));
                });

                console.log("My select ", $_my_select);
            }



        }

        return this;
    },
    /**
     * look up in the big menu and return sub menu for work_category if not found return null
     * @param menu array menu services [{name: <name of service>, <name>_services_list: [objects]},...]
     * @param work_category string name of service we would like to get sub menu
     * @return array [ {service_object_description_1, service_object_description_2,... }] | null
     */
    getWorkCategoryMenu: function (menu, work_category){

        var _work_category_menu_array = {};

        for (var i = 0; i < menu.length; i++){
            if (menu[i].work_category == work_category){
                for (var ii = 0; ii < menu[i].work_category_services_list.length; ii++){
                    _work_category_menu_array[menu[i].work_category_services_list[ii].id] = menu[i].work_category_services_list[ii].work_name;
                }

                return _work_category_menu_array;
            }
        }

        return null;
    },


    events: function() {

        return this;
    }

};

$(document).ready(function() {
    CustomerCard.initialize();
});
