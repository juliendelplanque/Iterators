"
My subclasses conditionally apply an action defined by my #block depending on the result of #conditionBlock evaluation with #next element and index provided as arguments.
"
Class {
	#name : #ConditionalActionIteratorDecorator,
	#superclass : #IteratorDecoratorWithBlock,
	#instVars : [
		'objectsSeenCount',
		'conditionBlock'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
ConditionalActionIteratorDecorator >> conditionBlock [
	^ conditionBlock
]

{ #category : #accessing }
ConditionalActionIteratorDecorator >> conditionBlock: anObject [
	conditionBlock := anObject
]

{ #category : #initialization }
ConditionalActionIteratorDecorator >> initialize [
	super initialize.
	objectsSeenCount := 0.
	self conditionBlock: [ true ]
]

{ #category : #testing }
ConditionalActionIteratorDecorator >> shouldApplyActionOnNext [
	^ conditionBlock cull: objectsSeenCount + 1 cull: self peek
]
