/***** INIT *****/

loadTreeRequest();

function loadTreeRequest() {
	Ext.Ajax.request({
		url: 'mainView/index',
		method: 'GET',
		success: function (result, request) {
			var jsonTree = Ext.decode(result.responseText);
			initGUI(jsonTree);
		},
		failure: function () {
			Ext.Msg.alert('FAIL');
		}
	});
}

function initGUI(jsonTree) {
	Ext.onReady(function() {	
		new Ext.Panel({
		    renderTo: document.body,
		    width: 700,
		    height: 500,
		    title: 'Simple QMS',
		    layout: 'border',
		    items: [{
		        xtype: 'treepanel',
		        title: 'Tree',
		        id: 'treePanel',
		        region:'west',
		        margins: '5 5 5 5',
		        split: true,
		        width: 200,
		        minWidth: 100,
		        maxWidth: 300,
		        autoScroll: true,
		        collapsible: true,
		        useArrows: true,
		        rootVisible: false,
		        root: new Ext.tree.AsyncTreeNode({
		            expanded: true,
		            children: jsonTree
		        }),
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
	                    			// TODO create node
	                        		break;
	                        	case 'edit-node':
	                        		editNodeRequest(item.parentMenu.contextNode.id);
	                        		break;
		                        case 'delete-node':
	                            	deleteNode(item.parentMenu.contextNode);
		                            break;
		                    }
		                }
		            }
		        }),
		        listeners: {
		            click: function(n) {
		            	showNodeRequest(n.attributes.id);
		            },
		            contextmenu: function(node, e) {
		            	contextMenuRender(node, e);
		            }
	        	}
		    }, {
		        id: 'main-panel',
		        region: 'center',
		        xtype: 'container',
		        margins: '5 5 5 0',
	            items: [{
			        id: 'main-view',
			        xtype: 'container',
			        //layout: 'fit',
		            defaults: {bodyStyle:'padding:10px'}
	            }, {
			        id: 'main-buttons',
			        xtype: 'container',
			        //layout: 'fit'
	            }]
		    }]
		});
	});	
}

function contextMenuRender(node, e) {
    node.select();
    var c = node.getOwnerTree().contextMenu;
    c.contextNode = node;
    
    var deleteItem = c.getComponent('delete-node');
    var createItem = c.getComponent('create-node');		                
    switch(node.getDepth()) {
    	case 1:
    		deleteItem.disable();
    		createItem.enable();
    		break;
    	case 4:
    		createItem.disable();
        	deleteItem.enable();
    		break;		                
    	default:
    		deleteItem.enable();
			createItem.enable();		                
    }
    
    c.showAt(e.getXY());
}

/***** SHOW *****/

function showNodeRequest(id) {
	Ext.Ajax.request({
		url: 'mainView/getInfo/' + id,
		method: 'GET',
		success: function (result, request) {
			var nodeInfo = Ext.decode(result.responseText);
			showInfo(nodeInfo);
		},
		failure: function () {
			Ext.Msg.alert('Loading node\'s info failed');
		}
	});
}

function showInfo(info) {
	var main = Ext.getCmp('main-view');
	var buttons = Ext.getCmp('main-buttons');
	main.removeAll();
	buttons.removeAll();
	
	var cmp = getComponent(info, true);
	main.add(cmp);
		
	main.doLayout();	
}

function getComponent(info, disabled) {
	var cmp;
	switch(info.type) {
		case 'org':
			cmp = getOrganizationCmp(info, disabled);
			break;
		case 'uni':
			cmp = getUnitCmp(info, disabled);
			break;
		case 'pro':
			cmp = getProjectCmp(info, disabled);
			break;
		case 'emp':
			cmp = getEmployeeCmp(info, disabled);
			break;			
	}
	return cmp;
}

function getOrganizationCmp(info, disabled) {
	var cmp = new Ext.Panel({
	    title: info.title,
	    layout: 'form',
        labelAlign: 'top',
        defaultType: 'textfield',
        defaults: {disabled: disabled},
	    items: [{
	    	fieldLabel: 'Organization name',
            value: info.name
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("save");
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("cancel");
	            }
        	}
        }]
	});
	return cmp;
}

function getUnitCmp(info, disabled) {
	var cmp = new Ext.Panel({
		title: info.title,
	    layout: 'form',
        labelAlign: 'top',
        defaultType: 'textfield',
        defaults: {disabled: disabled},
	    items: [{
	    	fieldLabel: 'Unit name',
            value: info.name
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("save");
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("cancel");
	            }
        	}
        }]
	});
	return cmp;
}

function getProjectCmp(info, disabled) {
	var cmp = new Ext.Panel({
		title: info.title,
		layout: 'form',
        labelAlign: 'top',
        defaultType: 'textfield',
        defaults: {disabled: disabled},
	    items: [{
	    	fieldLabel: 'Project name',
            value: info.name
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("save");
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("cancel");
	            }
        	}
        }]
	});
	return cmp;
}

function getEmployeeCmp(info, disabled) {
	var cmp = new Ext.TabPanel({
	    title: info.title,
	    activeTab: 0,
	    items: [{
	    	title: info.title,
	    	layout: 'form',
	        labelAlign: 'top',
	        defaultType: 'textfield',
	        defaults: {disabled: disabled},
		    items: [{
		    	fieldLabel: 'First name',
	            value: info.firstName
		    }, {
		    	fieldLabel: 'Last name',
	            value: info.lastName
		    }]
	    }, {
    		// TODO Contacts
	    	title: 'Contacts',
	    	items: [{
		    	xtype: 'label',
		        text: 'Project name: ' + info.name,
		        margins: '5 5 5 5'
	    	}]     
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("save");
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	alert("cancel");
	            }
        	}
        }]
	});
	return cmp;
}

/***** DELETE *****/

function deleteNode(node) {
	if (node.parentNode) {
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
}

/***** EDIT *****/

function editNodeRequest(id) {
	Ext.Ajax.request({
		url: 'mainView/getInfo/' + id,
		method: 'GET',
		success: function (result, request) {
			var nodeInfo = Ext.decode(result.responseText);
			editInfo(nodeInfo);
		},
		failure: function () {
			Ext.Msg.alert('Loading node\'s info failed');
		}
	});	
}

function editInfo(info) {
	var main = Ext.getCmp('main-view');
	var buttons = Ext.getCmp('main-buttons');
	main.removeAll();
	buttons.removeAll();
	
	var cmp = getComponent(info, false);
	main.add(cmp);
		
	main.doLayout();
	buttons.doLayout();
}

/***** CREATE *****/

