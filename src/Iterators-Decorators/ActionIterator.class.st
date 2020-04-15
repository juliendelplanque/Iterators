"
I am an iterator that perform an action on incoming objects (execute my #block with the object provided as argument), discard the result of the action and return that incoming object.
"
Class {
	#name : #ActionIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #accessing }
ActionIterator >> next [
	| toReturn |
	self block value: (toReturn := super next).
	^ toReturn
]
