Extension { #name : #Set }

{ #category : #'*Iterators-CollectionsExtensions' }
Set >> basicIterator [
	tally = 0
		ifTrue: [ ^ NullIterator new ].
	^ ((SequentialAccessIterator on: array)
			outputTo: [ :object | object isNotNil ] selectIt)
			outputTo: [ :object | object enclosedElement ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Set >> iterator [
	^ self basicIterator withCollectionAPI
]
