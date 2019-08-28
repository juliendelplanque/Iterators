Extension { #name : #IteratorDecorator }

{ #category : #'*Iterators-GTInspector' }
IteratorDecorator >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastTable
		title: 'Iterators composition';
		display: [ self dataflowOrderIteratorsIterator upToEnd ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Data flow order' evaluated: [ :value :index | index  asString ] width: 100;
		column: 'Item' evaluated: [ :value | GTObjectPrinter asTruncatedTextFrom: value ]
]
