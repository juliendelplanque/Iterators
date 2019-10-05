Extension { #name : #ZnEncodedStream }

{ #category : #'*Iterators-Streams' }
ZnEncodedStream >> basicIterator [
	^ StreamIterator stream: self
]

{ #category : #'*Iterators-Streams' }
ZnEncodedStream >> iterator [
	^ self basicIterator withCollectionAPI
]
