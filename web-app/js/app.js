Ext.Ajax.request({
	url: 'mainView/index',
	method: 'GET',
	success: function (result, request) {
		var jsonTree = Ext.decode(result.responseText);
		showTree(jsonTree);
	},
	failure: function () {
		alert('FAIL');
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
		        listeners: {
		            click: function(n) {
		            	loadInfo(n.attributes.id);
		            }
		        }
		    }, {
		        title: 'Center Region',
		        id: 'main-panel',
		        region: 'center',
		        xtype: 'container',
		        layout: 'fit',
		        margins: '5 5 5 0',
		        unstyled: true
		    }]
		});
	});

}

var nodeInfo;

function loadInfo(id) {
	
	Ext.Ajax.request({
		url: 'mainView/getInfo/' + id,
		method: 'GET',
		success: function (result, request) {
			nodeInfo = Ext.decode(result.responseText);
			showInfo(nodeInfo);
		},
		failure: function () {
			Ext.Msg.alert('FAIL');
		}
	});	
}

function showInfo(info) {
	var cmp = Ext.getCmp('main-panel');
	cmp.removeAll();
	showOrganization(cmp, info);
	
	if(info.type == 'org') {
		showOrganization(cmp, info);
	} else if(info.type == 'uni') {
		showUnit(cmp, info);
	} else if(info.type == 'pro') {
		showUnit(cmp, info);
	} else if(info.type == 'emp') {
		showProject(cmp, info);
	} else {
		Ext.Msg.alert('FAIL type = ' + info.type);
	}
		
	cmp.doLayout();	
}

function showOrganization(cmp, info) {
	cmp.add({
	    title: info.title
	});
}

function showUnit(cmp, info) {
	cmp.add({
	    title: info.title
	});
}

function showProject(cmp, info) {
	cmp.add({
	    title: info.title
	});
}

function showEmployee(cmp, info) {
	cmp.add({
	    title: info.title
	});
}

