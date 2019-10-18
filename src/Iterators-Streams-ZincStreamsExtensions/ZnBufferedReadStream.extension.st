Extension { #name : #ZnBufferedReadStream }

{ #category : #'*Iterators-Streams-ZincStreamsExtensions' }
ZnBufferedReadStream >> basicIterator [
	^ StreamIterator stream: self
]

{ #category : #'*Iterators-Streams-ZincStreamsExtensions' }
ZnBufferedReadStream >> iterator [
	^ self basicIterator withCollectionAPI
]
