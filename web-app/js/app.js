/* ===== INIT METHODS ===== */

Ext.Ajax.request({
	url: 'mainView/index',
	method: 'GET',
	success: function (result, request) {
		var jsonTree = Ext.decode(result.responseText);
		showTree(jsonTree);
	},
	failure: function () {
		Ext.Msg.alert('FAIL');
	}
});

function showTree(jsonTree) {

	Ext.onReady(function() {
		var borderPanel = new Ext.Panel({
		    renderTo: document.body,
		    width: 700,
		    height: 500,
		    title: 'Simple QMS',
		    layout: 'border',
		    items: [{
		        xtype: 'treepanel',
		        title: 'Tree',
		        region:'west',
		        margins: '5 5 5 5',
		        split: true,
		        width: 200,
		        minWidth: 100,
		        maxWidth: 300,
		        autoScroll: true,
		        collapsible: true,
		        useArrows: true,
		        root: new Ext.tree.AsyncTreeNode({
		            expanded: true,
		            children: jsonTree
		        }),
		        rootVisible: false,
		        id: 'treePanel',
		        contextMenu: new Ext.menu.Menu({
		            items: [{
		                id: 'create-node',
		                text: 'Create node'
		            }, {
		                id: 'edit-node',
		                text: 'Edit node'
		            },{
		                id: 'delete-node',
		                text: 'Delete node'
		            }],
		            listeners: {
		                itemclick: function(item) {
		                    switch (item.id) {
	                        	case 'create-node':

	                        		break;
	                        	case 'edit-node':
		                            var n = item.parentMenu.contextNode;
	                        		Ext.Ajax.request({
	        		            		url: 'mainView/getInfo/' + n.id,
	        		            		method: 'GET',
	        		            		success: function (result, request) {
	        		            			var nodeInfo = Ext.decode(result.responseText);
	        		            			editNode(nodeInfo);
	        		            		},
	        		            		failure: function () {
	        		            			Ext.Msg.alert('Loading node\'s info failed');
	        		            		}
	        		            	});
	                        		break;
		                        case 'delete-node':
		                            var n = item.parentMenu.contextNode;
		                            if (n.parentNode) {
		                            	deleteNode(n);
		                            }
		                            break;
		                    }
		                }
		            }
		        }),
		        listeners: {
		            click: function(n) {
		            	Ext.Ajax.request({
		            		url: 'mainView/getInfo/' + n.attributes.id,
		            		method: 'GET',
		            		success: function (result, request) {
		            			var nodeInfo = Ext.decode(result.responseText);
		            			showInfo(nodeInfo);
		            		},
		            		failure: function () {
		            			Ext.Msg.alert('Loading node\'s info failed');
		            		}
		            	});
		            },
		            contextmenu: function(node, e) {
			                node.select();
			                var c = node.getOwnerTree().contextMenu;
			                c.contextNode = node;
			                
			                var deleteItem = c.getComponent('delete-node');
			                if(node.getDepth() == 1) {
			                	deleteItem.disable();
			                } else {
			                	deleteItem.enable();
			                }
			                
			                var createItem = c.getComponent('create-node');
			                if(node.getDepth() == 4) {
			                	createItem.disable();
			                } else {
			                	createItem.enable();
			                }
			                
			                c.showAt(e.getXY());
			            }
		        }
		    }, {
		        title: 'Center Region',
		        id: 'main-panel',
		        region: 'center',
		        xtype: 'container',
		        layout: 'fit',
		        margins: '5 5 5 0',
	            defaults:{bodyStyle:'padding:10px'}, 
		    }]
		});
	});

}

/* ===== SHOW METHODS ===== */


function showInfo(info) {
	var cmp = Ext.getCmp('main-panel');
	cmp.removeAll();
	
	switch(info.type) {
		case 'org':
			showOrganization(cmp, info);
			break;
		case 'uni':
			showUnit(cmp, info);
			break;
		case 'pro':
			showProject(cmp, info);
			break;
		case 'emp':
			showEmployee(cmp, info);
			break;			
	}
		
	cmp.doLayout();	
}

function showOrganization(cmp, info) {
	cmp.add({
	    title: info.title,
	    layout: 'form',
        labelAlign: 'top',
        defaultType: 'textfield',
        defaults: {disabled: true},
	    items: [{
	    	fieldLabel: 'Organization name',
            value: info.name
	    }]
	});
}

function showUnit(cmp, info) {
	cmp.add({
		title: info.title,
	    layout: 'form',
        labelAlign: 'top',
        defaultType: 'textfield',
        defaults: {disabled: true},
	    items: [{
	    	fieldLabel: 'Unit name',
            value: info.name
	    }]
	});
}

function showProject(cmp, info) {
	cmp.add({
		title: info.title,
		layout: 'form',
        labelAlign: 'top',
        defaultType: 'textfield',
        defaults: {disabled: true},
	    items: [{
	    	fieldLabel: 'Project name',
            value: info.name
	    }]
	});
}

function showEmployee(cmp, info) {
	cmp.add({
    	xtype: 'tabpanel',
	    title: info.title,
	    activeTab: 0,
	    items: [{
	    	title: info.title,
	    	layout: 'form',
	        labelAlign: 'top',
	        defaultType: 'textfield',
	        defaults: {disabled: true},
		    items: [{
		    	fieldLabel: 'First name',
	            value: info.firstName
		    }, {
		    	fieldLabel: 'Last name',
	            value: info.lastName
		    }]
	    }, {
	    	title: 'Contacts',
		    layout: 'vbox', 
	    	items: [{
		    	xtype: 'label',
		        text: 'Project name: ' + info.name,
		        margins: '5 5 5 5'
	    	}]     
	    }]
	});
}

/* ===== DELETE METHODS ===== */

function deleteNode(node) {
	Ext.Ajax.request({
		url: 'mainView/deleteNode/' + node.id,
		method: 'GET',
		success: function (result, request) {
			node.remove();
		},
		failure: function () {
			Ext.Msg.alert('Cannot delete node');
		}
	});
}

/* ===== EDIT METHODS ===== */

function editNode(info) {
	switch(info.type) {
		case 'org':
			showOrganization(cmp, info);
			break;
		case 'uni':
			showUnit(cmp, info);
			break;
		case 'pro':
			showProject(cmp, info);
			break;
		case 'emp':
			showEmployee(cmp, info);
			break;			
	}
}

function editOrganization() {
	
}


/* ===== CREATE METHODS ===== */
