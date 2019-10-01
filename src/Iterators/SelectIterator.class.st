"
I select the object returned by #next method of the iterator I decorate using the result of the evalution of my #block with this object as argument.
I the evalution of the #block returns true, I return the object. Else I ignore the object and try the #next one.
"
Class {
	#name : #SelectIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'next'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
SelectIterator >> hasNext [
	next ifNotNil: [ ^ true ].
	[ 
		self decoratedIterator hasNext
			ifFalse: [
				next := nil.
				^false ].
		self block value: (next := self decoratedIterator next)
	] whileFalse.
	^ true
]

{ #category : #accessing }
SelectIterator >> next [
	next ifNotNil: [ 
		|toReturn|
		toReturn := next.
		next := nil.
		^ toReturn ].
	
	self checkHasNext.
	^ self next
]

{ #category : #accessing }
SelectIterator >> peek [
	next ifNotNil: [ 
		^ next ].
	
	self checkHasNext.
	^ self peek
]
