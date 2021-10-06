$(function() {
    let SelectedGarageVehicle
    let SelectedNearVehicle
    let SelectedImpoundVehicle
    function ui(bool) {
      if (bool) {
        $(".ui").fadeIn();

        SelectedGarageVehicle = null;
        SelectedNearVehicle = null;
        SelectedImpoundVehicle = null;
      } else {
        $(".ui").fadeOut();

        SelectedGarageVehicle = null;
        SelectedNearVehicle = null;
        SelectedImpoundVehicle = null;
        $('.putin_vehicle .cars').empty();
        $('.getout_vehicle .cars').empty();
      }
    }

    function impound_ui(bool) {
      if (bool) {
        $(".ui2").fadeIn();

      } else {
        $(".ui2").fadeOut();
        $('.impound .cars').empty();
      }
    }
    
    ui(false)
    impound_ui(false)

    window.addEventListener("message", function(event){
      var item = event.data;
      if (item.type === "ui") {
        if (item.display === true) {
          $('#sidebar_info_garagepoint').html(item.data.garagepoint);
          ui(true);
          
          if (item.data.garagecars.length != 0) {
            
            for (let i in item.data.garagecars) {
              let car = item.data.garagecars[i];
              if (car.stored & car.job == "civ") {
                $(".getout_vehicle .cars").append('<button class="car" id="car-' + (car.plate).replace(' ', '_') + '"><i class="fas fa-car"></i><h3>' + car.labelname + '</h3><p>' + car.plate + '</p></button>');
              }
            }

            $(".car").click(function() {

              if (this.id != SelectedGarageVehicle) {
                
                $('#' + SelectedGarageVehicle).css('border', 'none')
        
                $(this).css('border-left', '#ff9800 4px solid')
                $(this).css('border-right', '#ff9800 4px solid')
                SelectedGarageVehicle = this.id
        
              } 
            });
          }

          if (item.data.nearcars.length !=0) {
            

            for (let i in item.data.nearcars) {
              let car = item.data.nearcars[i]

              $('.putin_vehicle .cars').append('<button class="car" id="car-' + car.vehicle + '"><i class="fas fa-car"></i><h3>' + car.labelname + '</h3><p>' + car.plate + '</p></button>');
            }

            $(".car").click(function() {

              let id = $(this).attr('id').replace('car-', '');

              

              if (this.id != SelectedNearVehicle) {
                $('#' + SelectedNearVehicle).css('border', 'none')
        
                $(this).css('border-left', '#ff9800 4px solid')
                $(this).css('border-right', '#ff9800 4px solid')
                SelectedNearVehicle = this.id
        
                
              } 
            });
          }


        } else {
          ui(false);
        }  
      }
      
      if (item.type == "ui_impound") {
        if (item.display === true) {
          $('#sidebar_info_impoundpoint').html(item.data.impoundpoint);
          impound_ui(true)

          if (item.data.impoundcars.length !=0) {
              
            for (let i in item.data.impoundcars) {
              let car = item.data.impoundcars[i]

              $('.impound .cars').append('<button class="car" id="car-' + (car.plate).replace(' ', '_') + '"><i class="fas fa-car"></i><h3>' + car.labelname + '</h3><p>' + car.plate + '</p></button>');
            }

            $(".car").click(function() {

              if (this.id != SelectedImpoundVehicle) {
                
                $('#' + SelectedImpoundVehicle).css('border', 'none')
        
                $(this).css('border-left', '#ff9800 4px solid')
                $(this).css('border-right', '#ff9800 4px solid')
                SelectedImpoundVehicle = this.id
        
              } 
            });
          } else {
            $('.impound .cars').append('<button class="car-info" style="border: 1px solid firebrick"><i class="fas fa-info-circle" style="color: firebrick"></i><p> Keine Fahrzeuge im Abschlepphof! </p></button>');
          }
        } else {
          impound_ui(false)
        }
      }

    })
      


    

    $(".closepanel").click(function() {
  
        $.post("http://champion_garage/close", JSON.stringify({}));
        return;
    })

    $("#insert_vehicle").click(function() {
      ChangeSection("insert_vehicle")
    })
  
    $("#out_vehicle").click(function() {
      ChangeSection("out_vehicle")
    })

    $("#getout_vehicle_button").click(function() {
      if (SelectedGarageVehicle != null) {
        let replace = SelectedGarageVehicle.replace('car-' , '')
        let id = replace.replace('_' , ' ')
        
        $.post('http://champion_garage/getOutVehicle', JSON.stringify({
          plate: id
        }))
      }
    })

    $("#putin_vehicle_button").click(function() {
      if (SelectedNearVehicle != null) {
        let id = SelectedNearVehicle.replace('car-', '');
        $.post('http://champion_garage/putInVehicle', JSON.stringify({
          vehicle: id
        }))
      }
    })

    $("#getout_impound_button").click(function() {
      if (SelectedImpoundVehicle != null) {
        let replace = SelectedImpoundVehicle.replace('car-', '')
        let id = replace.replace('_', ' ')

        $.post('http://champion_garage/releaseVehicle', JSON.stringify({
          plate: id
        }))
      }
    })

    function ChangeSection(newSection) {

      if (newSection == "insert_vehicle") {
        $('.getout_vehicle').fadeOut()

        $('#out_vehicle').css({"border-left": "none", "background-color": "transparent"})
        $('#insert_vehicle').css({"border-left": "5px solid #ff9800", "background-color": "rgba(0, 0, 0, 0.5)"})
        
        $('.putin_vehicle').fadeIn()

      } else if (newSection == "out_vehicle") {
        $('.putin_vehicle').fadeOut()

        $('#insert_vehicle').css({"border-left": "none", "background-color": "transparent"})
        $('#out_vehicle').css({"border-left": "5px solid #ff9800", "background-color": "rgba(0, 0, 0, 0.5)"})

        $('.getout_vehicle').fadeIn()

      }
    }
})
  