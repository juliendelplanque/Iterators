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
		column: 'Data flow order' evaluated: [ :value :idex | idex asString ] width: 100;
		column: 'Item' evaluated: [ :value | GTObjectPrinter asTruncatedTextFrom: value ]";
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]"
]
