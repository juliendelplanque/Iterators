Extension { #name : #NeoCSVReader }

{ #category : #'*Iterators-NeoCSV' }
NeoCSVReader >> basicIterator [
	^ NeoCSVIterator neoCSVReader: self
]

{ #category : #'*Iterators-NeoCSV' }
NeoCSVReader >> iterator [
	^ self basicIterator withCollectionAPI
]
