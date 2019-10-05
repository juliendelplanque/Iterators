Class {
	#name : #PiecesCutWhereIterator,
	#superclass : #BufferizedIterator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators'
}

{ #category : #private }
PiecesCutWhereIterator >> bufferizeNext [
	| previous toAddInBuffer |
	buffer := OrderedCollection new.
	self decoratedIterator hasNext
		ifFalse: [ 
			buffer := nil.
			^ self ].
	previous := self decoratedIterator next.
	buffer add: previous.
	self decoratedIterator hasNext
		ifFalse: [ 
			buffer := buffer asArray.
			^ self ].
		
	(self block value: previous value: self decoratedIterator peek)
		ifTrue: [ 
			buffer := buffer asArray.
			^ self ].
	
	[ (self decoratedIterator hasNext) ]
		whileTrue: [ 
			(self block value: previous value: self decoratedIterator peek)
				ifTrue: [ 
					buffer := buffer asArray.
					^ self ].
			toAddInBuffer := self decoratedIterator next.
			buffer add: toAddInBuffer.
			previous := toAddInBuffer ].
	
	buffer := buffer asArray
]

{ #category : #testing }
PiecesCutWhereIterator >> hasNext [
	buffer ifNil: [ self bufferizeNext ].
	
	^ buffer isNotNil
]
