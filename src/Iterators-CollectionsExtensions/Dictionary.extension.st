Extension { #name : #Dictionary }

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> associationsIterator [
	^ self basicAssociationsIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicAssociationsIterator [
	tally = 0
		ifTrue: [ ^ NullIterator new ].
	^ ((SequentialAccessIterator on: array)
			outputTo: [ :object | object isNotNil ] selectIt)
			outputTo: [ :association | association copy ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicIterator [
	^ self basicValuesIterator
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicKeysIterator [
	^ self basicAssociationsIterator
		outputTo: [ :object | object key ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
Dictionary >> basicValuesIterator [
	^ self basicAssociationsIterator
		outputTo: [ :object | object value ] collectIt
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
