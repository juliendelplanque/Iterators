Extension { #name : #Dictionary }

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> associationsIterator [
	tally = 0
		ifTrue: [ ^ NullIterator new ].
	^ (SequentialAccessIterator on: array)
		| [ :object | object isNotNil ] selectIt
		| [ :association | association copy ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> iterator [
	^ self valuesIterator
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> keysIterator [
	^ self associationsIterator
		| [ :object | object key ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> valuesIterator [
	^ self associationsIterator
		| [ :object | object value ] collectIt
]
