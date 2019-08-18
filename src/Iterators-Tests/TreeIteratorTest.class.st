Class {
	#name : #TreeIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #testing }
TreeIteratorTest class >> isAbstract [
	^ self = TreeIteratorTest
]

{ #category : #accessing }
TreeIteratorTest >> objectToWalk [
	^ #(1 #(2 #(2)) #(4 #(5 #(6 #(3))) #(4)))
]
