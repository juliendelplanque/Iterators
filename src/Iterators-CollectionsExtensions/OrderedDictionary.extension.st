Extension { #name : #OrderedDictionary }

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> associationsIterator [
	^ self basicAssociationsIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> basicAssociationsIterator [
	^ self basicKeysIterator
		outputTo: [ :key | self associationAt: key ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> basicIterator [
	^ self basicValuesIterator
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> basicKeysIterator [
	^ (IntervalIterator start: 1 end: self size)
			outputTo: [:i | orderedKeys at: i ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> basicValuesIterator [
	^ self basicKeysIterator
		outputTo: [ :key | self at: key ] collectIt
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> iterator [
	^ self valuesIterator
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> keysIterator [
	^ self basicKeysIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
OrderedDictionary >> valuesIterator [
	^ self basicValuesIterator withCollectionAPI
]
