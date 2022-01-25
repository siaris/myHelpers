//async await yg sering banget penggunaannya gak keinget
var loadMap = function(){
	async function inti(M){
		for(i in M){
			append_form(i)
			var dd = await get_ajax(i)
			addOption($('[name="map_json['+i+'][]"]'), dd, 'id', 'display')
			$('[name="map_json['+i+'][]"]').select2("val", M[i])
		}
	}
	async function get_ajax(identifier_map){
		R = await $.ajax({
			url: "<?php echo site_url('url/services')?>/" + identifier_map,
			dataType: "json",
			type: "GET",
			success: function(d) {
				return d
			}
		});
		return R
	}
	return{init:inti}
}()