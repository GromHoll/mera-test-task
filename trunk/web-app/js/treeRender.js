
function buildTree(treeData) {
	var treeView = new YAHOO.widget.TreeView("navigationTree", treeData);
	treeView.draw();
	    
    var currentTextNode = null;

    function addNode() {
        var newLabel = window.prompt("Enter a label for the new node: ", ""),
            oChildNode;

        if (newLabel && newLabel.length > 0) {
            oChildNode = new YAHOO.widget.TextNode(newLabel, currentTextNode, false);
            currentTextNode.refresh();
            currentTextNode.expand();
        }
    }     

    function editNode() {
        var newLabel = window.prompt("Enter a new label for this node: ", currentTextNode.getLabelEl().innerHTML);

        if (newLabel && newLabel.length > 0) {
            currentTextNode.getLabelEl().innerHTML = YAHOO.lang.escapeHTML(newLabel);
        }
    }    

    function deleteNode() {
    	if(currentTextNode.depth != 0) {
    		$.ajax({
        		url:"/TestTask/mainView/deleteNode/" + currentTextNode.data.id,
        	    success: function(response) {
            		treeView.removeNode(currentTextNode);
                    treeView.draw();
        	    },
        	    error: function(request, status, error) {
        	        alert(error)
        	    },
        	    complete: function() {
        	    }
        	});
    	} else {
    		alert("Cannot delete organization")
    	}
    	
    }    

    function onTriggerContextMenu(p_oEvent) {
        var target = this.contextEventTarget;
        currentTextNode = treeView.getNodeByElement(target);
        if (!currentTextNode) {
            this.cancel();
        }
    }
    
    treeView.subscribe("labelClick", function(node) { 
    	alert(node); 
	});

    var contextMenu = new YAHOO.widget.ContextMenu(
        "treeContextMenu",
        {
            trigger: "navigationTree",
            lazyload: true,
            itemdata: [
                { text: "Add Child Node", onclick: { fn: addNode } },
                { text: "Edit Node", onclick: { fn: editNode } },
                { text: "Delete Node", onclick: { fn: deleteNode } }
            ]
        }
    );
    
    contextMenu.subscribe("triggerContextMenu", onTriggerContextMenu);
    
}
