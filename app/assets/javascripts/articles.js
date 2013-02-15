$(document).ready(function() {

	$('#sortme').sortable(
		{ connectWith: '.connectedSortable' }, 
    { update: function() {
    	$.ajax(
			  { type  : 'POST',
			    url   : '/articles/update_articles/',
			    data  : $('#sortme').sortable('serialize')
			  } 
			);
			console.log($('#sortme').sortable('serialize') + "&read_article=" + $('#sortme2').sortable('serialize'));
    }
	});

	$('#sortme2').sortable(
		{ connectWith: '.connectedSortable' }, 
    { update: function() {
    	$.ajax(
			  { type  : 'POST',
			    url   : '/articles/update_articles/',
			    data  : $('#sortme2').sortable('serialize')
			  } 
			);
			console.log($('#sortme2').sortable('serialize') + "&album=" + $(this).attr('id'));
    }
	});

});
