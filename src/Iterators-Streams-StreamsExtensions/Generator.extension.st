Extension { #name : #Generator }

{ #category : #'*Iterators-Streams-StreamsExtensions' }
Generator >> basicIterator [
	^ StreamIterator stream: self
]

{ #category : #'*Iterators-Streams-StreamsExtensions' }
Generator >> iterator [
	^ self basicIterator withCollectionAPI
]
