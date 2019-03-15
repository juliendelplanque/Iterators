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
