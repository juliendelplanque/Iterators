Extension { #name : #Set }

{ #category : #'*Iterators-CollectionsExtensions' }
Set >> basicIterator [
	tally = 0
		ifTrue: [ ^ NullIterator new ].
	^ (SequentialAccessIterator on: array)
			| [ :object | object isNotNil ] selectIt
			| [ :object | object enclosedSetElement ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Set >> iterator [
	^ self basicIterator withCollectionAPI
]
