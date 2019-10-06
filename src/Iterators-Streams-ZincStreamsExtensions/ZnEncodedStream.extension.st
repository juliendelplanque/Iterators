Extension { #name : #ZnEncodedStream }

{ #category : #'*Iterators-Streams-ZincStreamsExtensions' }
ZnEncodedStream >> basicIterator [
	^ StreamIterator stream: self
]

{ #category : #'*Iterators-Streams-ZincStreamsExtensions' }
ZnEncodedStream >> iterator [
	^ self basicIterator withCollectionAPI
]
