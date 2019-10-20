"
I am an class holding tests for a breadth-first tree iterator.
"
Class {
	#name : #BreadthFirstIteratorTest,
	#superclass : #TreeIteratorTest,
	#category : #'Iterators-Trees-Tests'
}

{ #category : #'iterator creation' }
BreadthFirstIteratorTest >> createIteratorOn: anObject [
	^ BreadthFirstIterator root: anObject childrenBlock: #allButFirst
]

{ #category : #accessing }
BreadthFirstIteratorTest >> iteratorWalk [
	^ #(
	#(1 #(2 #(2)) #(4 #(5 #(6 #(3))) #(4)))
	#(2 #(2))
	#(4 #(5 #(6 #(3))) #(4))
	#(2)
	#(5 #(6 #(3)))
	#(4)
	#(6 #(3))
	#(3)
	)
]
