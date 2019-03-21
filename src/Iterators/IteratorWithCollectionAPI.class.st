"
I am an iterator decorator that provides an API similar to Collection's API.
"
Class {
	#name : #IteratorWithCollectionAPI,
	#superclass : #IteratorDecorator,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
IteratorWithCollectionAPI >> allButFirst [
	"Answer an array containing all but the first element.
	 Raise an error if there are not enough elements."

	^ self allButFirst: 1
]

{ #category : #accessing }
IteratorWithCollectionAPI >> allButFirst: n [
	"Answer an array  containing all but the first n elements.
	 Raise an error if there are not enough elements."
	n timesRepeat: [ self next ].
	^ self upToEnd
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> allSatisfy: aBlock [
	"Evaluate aBlock with the nodes of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self do: [:each | (aBlock value: each) ifFalse: [^ false]].
	^ true
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> anySatisfy: aBlock [
	"Evaluate aBlock with the nodes of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self do: [:each | (aBlock value: each) ifTrue: [^ true]].
	^ false
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> collect: aBlock [
	^ self collect: aBlock as: Array
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> collect: aBlock as: aSequenceableCollection [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into an instance of aSequenceableCollection.
	Answer the new collection."

	^ aSequenceableCollection streamContents: [ :stream |
		self do: [ :each | stream nextPut: (aBlock value: each)] ].
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> count: aBlock [ 
	"Evaluate aBlock with each of the receiver's nodes as the argument.  
	Answer the number of nodes that answered true."

	| sum |
	sum := 0.
	self do: [:each | (aBlock value: each) ifTrue: [sum := sum + 1]].
	^ sum
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> detect: aBlock [
	^ self detect: aBlock ifNone: [ NotFound signalFor: aBlock ]
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> detect: aBlock ifFound: ifFoundBlock [
	self detect: aBlock ifFound: ifFoundBlock ifNone: [ "Do nothing on purpose" ]
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> detect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock [
	"Search for the first node for which aBlock returns true.
	 If found, evaluate ifFoundBlock with the found node as arg.
	 If not found, evaluate ifNoneBlock without arg."
	self do: [ :child |
		(aBlock value: child)
			ifTrue: [ ^ ifFoundBlock cull: child ] ].
		
	^ ifNoneBlock value
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> detect: aBlock ifNone: ifNoneBlock [
	^ self detect: aBlock ifFound: [ :found | found ] ifNone: ifNoneBlock
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> detectMax: aBlock [
	"Evaluate aBlock with node of the receiver's nodes as the argument. 
	Answer the element for which aBlock evaluates to the highest magnitude.
	If collection empty, return nil."

	| maxElement maxValue |
	maxValue := nil.
	self do: [:each |
		| val |
		maxValue
			ifNotNil: [
				(val := aBlock value: each) > maxValue ifTrue: [
					maxElement := each.
					maxValue := val]]
			ifNil: ["first element"
				maxElement := each.
				maxValue := aBlock value: each ] ].
	^ maxElement
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> detectMin: aBlock [
	"Evaluate aBlock with each of the receiver's nodes as the argument. 
	Answer the element for which aBlock evaluates to the lowest number.
	If collection empty, return nil."

	| minElement minValue |
	minValue := nil.
	self do: [:each |
		| val |
		minValue
			ifNotNil: [
				(val := aBlock value: each) < minValue ifTrue: [
					minElement := each.
					minValue := val]]
			ifNil: ["first element"
				minElement := each.
				minValue := aBlock value: each ] ].
	^ minElement
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> do: aBlock [
	"Executes aBlock on all the objects returned by #next until #hasNextReturn false."
	[ self hasNext ] whileTrue: [ 
		aBlock value: self next ]
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> do: doBlock separatedBy: separatorBlock [
	"Evaluate the doBlock for all nodes in the receiver,
	and evaluate the separatorBlock between."

	| beforeFirst | 
	beforeFirst := true.
	self do:
		[:each |
		beforeFirst
			ifTrue: [beforeFirst := false]
			ifFalse: [separatorBlock value].
		doBlock value: each ]
]

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

{ #category : #enumerating }
IteratorWithCollectionAPI >> reject: aBlock [
	^ self reject: aBlock as: Array
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> reject: aBlock as: aSequenceableCollectionClass [
	"Selects nodes of the AST for which aBlock returns false.
	 Returns these nodes in aSequenceableCollectionClass instance."
	^ aSequenceableCollectionClass streamContents: [ :stream |
		self do: [ :child |
		(aBlock value: child)
			ifFalse: [ stream nextPut: child ] ] ]
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> select: aBlock [
	^ self select: aBlock as: Array
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> select: aBlock as: aSequenceableCollectionClass [
	"Select nodes of the AST for which aBlock returns true.
	 Returns these nodes in aSequenceableCollectionClass instance."
	^ aSequenceableCollectionClass streamContents: [ :stream |
		self do: [ :child |
		(aBlock value: child)
			ifTrue: [ stream nextPut: child ] ] ]
]

{ #category : #enumerating }
IteratorWithCollectionAPI >> sum: aBlock [
	"Evaluate aBlock with each of the receiver's nodes as the argument. 
	Return the sum of the answers."
	| sum |
	sum := 0.
	self do: [:each | 
		sum := (aBlock value: each) + sum].  
	^ sum
]
