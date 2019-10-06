Extension { #name : #ReadStream }

{ #category : #'*Iterators-Streams-StreamsExtensions' }
ReadStream >> basicIterator [
	^ StreamIterator stream: self
]

{ #category : #'*Iterators-Streams-StreamsExtensions' }
ReadStream >> iterator [
	^ self basicIterator withCollectionAPI
]
