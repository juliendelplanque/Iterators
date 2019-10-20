Extension { #name : #Object }

{ #category : #'*Iterators-Trees' }
Object >> anyTreeIterator: childrenBlock [
	"To be used when the algorithm you implement does not care about the way the tree is walked."
	^ self breadthFirstIterator: childrenBlock
]

{ #category : #'*Iterators-Trees' }
Object >> breadthFirstIterator: childrenBlock [
	^ (BreadthFirstIterator root: self childrenBlock: childrenBlock) withCollectionAPI
]

{ #category : #'*Iterators-Trees' }
Object >> depthFirstIterator: childrenBlock [
	^ (DepthFirstIterator root: self childrenBlock: childrenBlock) withCollectionAPI
]
