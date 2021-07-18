<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Droppable - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
  #draggable { width: 100px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; }
  #droppable { width: 300px; height: 300px; padding: 0.5em; float: left; margin: 10px; }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>
 
<div id="draggable" class="ui-widget-content">
  <p>Drag me to my target</p>
</div>
 
<div id="droppable" class="ui-widget-header">
  <p>Drop here</p>
</div>
 
 <script>
  /* $( function() {
    $( "#draggable" ).draggable();
    $( "#droppable" ).droppable({
      drop: function( event, ui ) {
        $( this )
          .addClass( "ui-state-highlight" )
          .find( "p" )
            .html( "Dropped!" );
      }
    });
  } ); */
  
  $("#droppable").on("dragenter", function(e){
  	console.log("dragenter");
      e.preventDefault();
      e.stopPropagation();
  }).on("dragover", function(e){
  	console.log("dragover");
      e.preventDefault();
      e.stopPropagation();
      $(this).css("background-color", "#FFD8D8");
  }).on("dragleave", function(e){
  	console.log("dragleave");
      e.preventDefault();
      e.stopPropagation();
      $(this).css("background-color", "#FFF");
  }).on("drop", function(e){
	  console.log("drop");      
	  e.preventDefault();
      $(this).css("background-color", "#FFF");
      console.log(files);
	  console.log(e.originalEvent.dataTransfer.files[0].name);
  })
  </script>
</body>
</html>