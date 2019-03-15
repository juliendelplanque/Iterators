Class {
	#name : #IteratorWithCollectionAPI,
	#superclass : #IteratorDecorator,
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
IteratorWithCollectionAPI >> identityIncludes: anObject [ 
	"Answer whether anObject is one of the receiver's elements."

	self do: [:each | anObject == each ifTrue: [^true]].
	^false
]

{ #category : #testing }
IteratorWithCollectionAPI >> includes: anObject [ 
	"Answer whether anObject is one of the receiver's elements."

	^ self anySatisfy: [:each | each = anObject]
]

{ #category : #testing }
IteratorWithCollectionAPI >> includesAll: aCollection [ 
	"Answer whether all the elements of aCollection are in the receiver."
	self flag: #TODO;error. "Can not be implemented as done below."
	aCollection do: [:elem | (self includes: elem) ifFalse: [^ false]].
	^ true
]

{ #category : #testing }
IteratorWithCollectionAPI >> includesAny: aCollection [ 
	"Answer whether any element of aCollection is one of the receiver's elements."
	aCollection do: [:elem | (self includes: elem) ifTrue: [^ true]].
	^ false
]

{ #category : #testing }
IteratorWithCollectionAPI >> occurrencesOf: anObject [ 
	"Answer how many of the receiver's elements are equal to anObject."

	| tally |
	tally := 0.
	self do: [:each | anObject = each ifTrue: [tally := tally + 1]].
	^tally
]
