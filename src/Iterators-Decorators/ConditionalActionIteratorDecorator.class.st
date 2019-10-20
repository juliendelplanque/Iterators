"
My subclasses conditionally apply an action defined by my #block depending on the result of #conditionBlock evaluation with #next element and index provided as arguments.
"
Class {
	#name : #ConditionalActionIteratorDecorator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'objectsSeenCount',
		'conditionBlock'
	],
	#category : #'Iterators-Decorators-Decorators'
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
	^ conditionBlock cull: objectsSeenCount cull: self peek
]
