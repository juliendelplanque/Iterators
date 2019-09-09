"
A ClassifyOnIteratorTest is a test class for testing the behavior of ClassifyOnIterator
"
Class {
	#name : #ClassifyOnIteratorTest,
	#superclass : #TestCase,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #tests }
ClassifyOnIteratorTest >> testOddAndEven [
	| classifier res |
	classifier := (ClassifyOnIterator
		classifier: [ :i | 
			i odd
				ifTrue: [ #odd ]
				ifFalse: [ #even ] ]) decorate: (1 to: 7) iterator.
	res := classifier next.
	self assert: res key equals: #even. "even sorted before odd"
	self assert: (res value > Array) size equals: 3.	"2 4 6"
	res := classifier next.
	self assert: res key equals: #odd.
	self assert: res value > Array equals: #(1 3 5 7).
	self assert: classifier hasNext not "no more please"
]
