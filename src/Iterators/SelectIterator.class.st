"
I select the object returned by #next method of the iterator I decorate using the result of the evalution of my #block with this object as argument.
I the evalution of the #block returns true, I return the object. Else I ignore the object and try the #next one.
"
Class {
	#name : #SelectIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
SelectIterator >> hasNext [
	[ 
		self decoratedIterator hasNext
			ifFalse: [ ^false ].
		self block value: self decoratedIterator peek
	] whileFalse: [ 
		"While select block does not return true, we ignore input of decorated iterator."
		self decoratedIterator next ].
	^ true
]

{ #category : #accessing }
SelectIterator >> next [
	self checkHasNext.
	^ super next
]

{ #category : #accessing }
SelectIterator >> peek [
	self checkHasNext.
	^ super peek
]
