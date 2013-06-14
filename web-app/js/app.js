/***** INIT *****/

initGUI();

function initGUI() {
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
		            expanded: true
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
	                    			createNode(item.parentMenu.contextNode);
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
		            defaults: {bodyStyle:'padding:10px'}
	            }, {
			        id: 'main-buttons',
			        xtype: 'container',
	            }]
		    }]
		});
	});
	
	loadTreeRequest();
}

function loadTreeRequest() {
	Ext.Ajax.request({
		url: 'mainView/index',
		method: 'GET',
		success: function (result, request) {
			var jsonTree = Ext.decode(result.responseText);
			updateTree(jsonTree);		
		},
		failure: function () {
			Ext.Msg.alert('tree loading is failed');
		}
	});
}

function updateTree(jsonTree) {
	var treePanel = Ext.getCmp('treePanel');
	treePanel.setRootNode(new Ext.tree.AsyncTreeNode({
	    expanded: true,
		children: jsonTree
	}));
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
	    	id: 'org-name',
            allowBlank: false,
	    	fieldLabel: 'Organization name',
            value: info.name
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            nodeId: info.id,
            listeners: {
	            click: function(n) {
	            	save( {type: 'org', id: n.nodeId} );
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	cancelEdit();
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
	    	id: 'uni-name',
            allowBlank: false,
	    	fieldLabel: 'Unit name',
            value: info.name
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            nodeId: info.id,
            parentId: info.parentId,
            listeners: {
	            click: function(n) {
	            	save( {type: 'uni', id: n.nodeId, "organization.id": n.parentId} );
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	cancelEdit();
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
	    	id: 'pro-name',
            allowBlank: false,
	    	fieldLabel: 'Project name',
            value: info.name
	    }],
        buttons: [{
            text: 'Save',
            hidden: disabled,
            nodeId: info.id,
            parentId: info.parentId,
            listeners: {
	            click: function(n) {
	            	save( {type: 'pro', id: n.nodeId, "unit.id": n.parentId} );
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	cancelEdit();
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
		    	id: 'emp-firstname',
	            allowBlank: false,
		    	fieldLabel: 'First name',
	            value: info.firstName
		    }, {
		    	id: 'emp-lastname',
	            allowBlank: false,
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
            nodeId: info.id,
            parentId: info.parentId,
            listeners: {
	            click: function(n) {
	            	save( {type: 'emp', "project.id": n.parentId} );
	            }
        	}
        }, {
            text: 'Cancel',
            hidden: disabled,
            listeners: {
	            click: function(n) {
	            	cancelEdit();
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

function cancelEdit() {
	var main = Ext.getCmp('main-view');
	var buttons = Ext.getCmp('main-buttons');
	main.removeAll();
	buttons.removeAll();	
}

/***** CREATE *****/

function createNode(parentNode) {
	var data;
	switch(parentNode.getDepth()) {
		case 1:
			data = {title: 'NEW UNIT', type: 'uni', parentId: parentNode.id};
			break;
		case 2:
			data = {title: 'NEW PROJECT', type: 'pro', parentId: parentNode.id};
			break;
		case 3:
			data = {title: 'NEW ENPLOYEE', type: 'emp', parentId: parentNode.id};
			break;
	}

	editInfo(data, false);	
}

/***** SAVE *****/

function save(data) {
	var flag = false;
	switch(data['type']) {
		case 'org':
			flag = saveOrganizationNode(data);
			break;
		case 'uni':
			flag = saveUnitNode(data);
			break;
		case 'pro':
			flag = saveProjectNode(data);
			break;
		case 'emp':
			flag = saveEmployeeNode(data);
			break;
	}	
	
	if(flag) {
		saveNodeRequest(data);
	} else {
		Ext.Msg.alert('Invalid data');
	}
}

function saveOrganizationNode(data) {
	var cmp = Ext.getCmp('org-name');
	if(cmp.validate()) {
		data['orgName'] = cmp.getValue();	
	} else {
		return false;
	}
	
	return true;
}

function saveUnitNode(data) {
	var cmp = Ext.getCmp('uni-name');
	if(cmp.validate()) {
		data['unitName'] = cmp.getValue();	
	} else {
		return false;
	}
	
	return true;
}

function saveProjectNode(data) {
	var cmp = Ext.getCmp('pro-name');
	if(cmp.validate()) {
		data['projectName'] = cmp.getValue();	
	} else {
		return false;
	}
	
	return true;	
}

function saveEmployeeNode(data) {
	var cmp = Ext.getCmp('emp-firstname');
	if(cmp.validate()) {
		data['firstName'] = cmp.getValue();	
	} else {
		return false;
	}
	
	cmp = Ext.getCmp('emp-lastname');
	if(cmp.validate()) {
		data['lastName'] = cmp.getValue();	
	} else {
		return false;
	}
	
	return true;	
}

function saveNodeRequest(data) {
	Ext.Ajax.request({
		url: 'mainView/saveNode',
		method: 'GET',
		params: data,
		success: function (result, request) {
			loadTreeRequest();
			cancelEdit();
		},
		failure: function () {
			Ext.Msg.alert('Saving node was failed');
		}
	});	
}

