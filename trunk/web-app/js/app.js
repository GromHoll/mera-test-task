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
		var myBorderPanel = new Ext.Panel({
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
		                Ext.Msg.alert('Navigation Tree Click', 'You clicked: "' + n.attributes.text + '"');
		            }
		        }
		    },{
		        title: 'Center Region',
		        region: 'center',
		        xtype: 'container',
		        layout: 'fit',
		        margins: '5 5 0 0'
		    }]
		});
	});

}
