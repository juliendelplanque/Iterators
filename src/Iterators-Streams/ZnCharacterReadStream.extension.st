Extension { #name : #ZnCharacterReadStream }

{ #category : #'*Iterators-Streams' }
ZnCharacterReadStream >> basicLineIterator [
	^ LineStreamIterator stream: self
]

{ #category : #'*Iterators-Streams' }
ZnCharacterReadStream >> lineIterator [
	^ self basicLineIterator withCollectionAPI
]
