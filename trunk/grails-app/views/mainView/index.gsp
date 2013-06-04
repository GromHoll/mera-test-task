<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
 
<html>

	<head>
		<g:javascript library="jquery"/>
		<r:layoutResources />
		
		<title>Simple QMS</title>
						
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset/reset.css">
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts.css">
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/treeview/assets/skins/sam/treeview.css">
		<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/menu/assets/skins/sam/menu.css">		
		<style type="text/css">	
			h1 {	
				font-weight: bold; 
				margin: 0 0 1em 0;
		   }
		   	
		   body {	   
		       padding: 1em;	   
		   }
		   	
		   p, ul {	
		       margin: 1em 0;	
		   }
		   		   
		   p em,
		   #operainstructions li em {	
		       font-weight: bold;	
		   }
		   		
		   #operainstructions {
		       list-style-type: square;
		       margin-left: 2em;	
		   }		
		</style>
	</head>
	
	<body>
		<div id=navigationTree class="yui-skin-sam">
			<g:render template="navigationTree" class="yui-skin-sam"/>
		</div>
		
		<hr>
		
		<div id=infoView>
			<g:render template="infoView"/>
		</div>
	</body>
	
</html>
