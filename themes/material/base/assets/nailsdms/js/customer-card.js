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
        console.log("this.$myCanvas", this.$myCanvas);
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

                _self.buildCustomerCard(json);

            }
        });

        return this;
    },

    buildCustomerCard: function(json) {
        this.customer_data_and_menu = json;
        this.service_type_track = [];
        var _self = this;
        var _td = json;

        // Set Panel title with customer name
        if ( _td.customer != null){
            this.$myCanvas.children('.panel-heading').children('.panel-title').html(_td.customer.c_firstname + ' ' + _td.customer.c_lastname);
        }

        if (_td.customer.work_tb.length > 0) {
            var _nail_tech_name_array = [];
            var _request_nail_tech_array = [];
            var _service_type_track = [];
            for (var i = 0; i < _td.customer.work_tb.length; i++){
                // Get Nails tech list
                if(_td.customer.work_tb[i].employee != null){
                    if( _td.customer.work_tb[i].employee.e_american_name != null){
                        _nail_tech_name_array.push(_td.customer.work_tb[i].employee.e_american_name);
                    } else{
                        _nail_tech_name_array.push(_td.customer.work_tb[i].employee.e_first_name + _td.customer.work_tb[i].employee.e_last_name);
                    }
                }
                // Get request nail tech list
                if(_td.customer.work_tb[i].request_for != null){
                    _request_nail_tech_array.push(_td.customer.work_tb[i].request_for);
                }
                //
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

                         

                        break;
                    case 'feet':
                        break;
                    case 'waxing':
                        break;
                }
            }
            this.$myCanvas.children('.panel-body').find('.request-nail-tech').html('Request: ' + _request_nail_tech_array.join(', '));
            this.$myCanvas.children('.panel-body').find('.nail-tech-serve').html('Nails tech: ' + _nail_tech_name_array.join(', '));
        }












        return this;
    },

    events: function() {

        return this;
    }

};

$(document).ready(function() {
    CustomerCard.initialize();
});
