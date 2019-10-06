Extension { #name : #ZnCharacterReadStream }

{ #category : #'*Iterators-Streams-ZincStreamsExtensions' }
ZnCharacterReadStream >> basicLineIterator [
	^ LineStreamIterator stream: self
]

{ #category : #'*Iterators-Streams-ZincStreamsExtensions' }
ZnCharacterReadStream >> lineIterator [
	^ self basicLineIterator withCollectionAPI
]
