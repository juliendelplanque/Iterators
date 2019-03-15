Extension { #name : #Set }

{ #category : #'*Iterators-CollectionsExtensions' }
Set >> iterator [
	tally = 0
		ifTrue: [ ^ NullIterator new ].
	^ (SequentialAccessIterator on: array)
			| [ :object | object isNotNil ] selectIt
			| [ :object | object enclosedSetElement ] collectIt
]
