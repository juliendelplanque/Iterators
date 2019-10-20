Class {
	#name : #DepthFirstIteratorTest,
	#superclass : #TreeIteratorTest,
	#category : #'Iterators-Trees-Tests'
}

{ #category : #'iterator creation' }
DepthFirstIteratorTest >> createIteratorOn: anObject [
	^ DepthFirstIterator root: anObject childrenBlock: #allButFirst
]

{ #category : #accessing }
DepthFirstIteratorTest >> iteratorWalk [
	^ #(
	#(1 #(2 #(2)) #(4 #(5 #(6 #(3))) #(4)))
	#(2 #(2))
	#(2)
	#(4 #(5 #(6 #(3))) #(4))
	#(5 #(6 #(3)))
	#(6 #(3))
	#(3)
	#(4)
	)
]
