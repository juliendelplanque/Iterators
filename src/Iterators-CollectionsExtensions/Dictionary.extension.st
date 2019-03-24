Extension { #name : #Dictionary }

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> associationsIterator [
	^ self basicAssociationsIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicAssociationsIterator [
	tally = 0
		ifTrue: [ ^ NullIterator new ].
	^ (SequentialAccessIterator on: array)
		| [ :object | object isNotNil ] selectIt
		| [ :association | association copy ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicIterator [
	^ self basicValuesIterator
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicKeysIterator [
	^ self associationsIterator
		| [ :object | object key ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicValuesIterator [
	^ self associationsIterator
		| [ :object | object value ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> iterator [
	^ self valuesIterator
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> keysIterator [
	^ self basicKeysIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> valuesIterator [
	^ self basicValuesIterator withCollectionAPI
]
