Extension { #name : #Object }

{ #category : #'*Iterators' }
Object >> anyTreeIterator: childrenBlock [
	"To be used when the algorithm you implement does not care about the way the tree is walked."
	^ self breadthFirstIterator: childrenBlock
]

{ #category : #'*Iterators' }
Object >> breadthFirstIterator: childrenBlock [
	^ (BreadthFirstIterator root: self childrenBlock: childrenBlock) withCollectionAPI
]

{ #category : #'*Iterators' }
Object >> depthFirstIterator: childrenBlock [
	^ (DepthFirstIterator root: self childrenBlock: childrenBlock) withCollectionAPI
]
