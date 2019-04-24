function PlayItUp(config){
	if(!config)
        config = {};

    let playItUp = {
        user_id: config.user_id || 0,

        init: function(){
            let me = this;
            me.bindUiEvents();
            me.pageLoadEvents();
        },
        
        bindUiEvents: function(){
            let me = this;
            console.log("ui event bindings");
        },

        pageLoadEvents:function(){
            let me = this;
            console.log("page load events");
        },
    }    

    return playItUp;
}

$(document).ready(function(){
	if(window.location.pathname.search('index')>0){		
		let playItUp = new PlayItUp({
			user_id: $("#user_id").val(),
        });
        
        playItUp.init();
	}
})