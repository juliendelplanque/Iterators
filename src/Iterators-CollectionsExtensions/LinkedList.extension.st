Extension { #name : #LinkedList }

{ #category : #'*Iterators-CollectionsExtensions' }
LinkedList >> basicIterator [
	^ LinkedListIterator on: self firstLink nextLinkBlock: #nextLink extractBlock: #value
]

{ #category : #'*Iterators-CollectionsExtensions' }
LinkedList >> basicReversedIterator [
	^ ReverseLinkedListIterator on: self firstLink nextLinkBlock: #nextLink extractBlock: #value
]
